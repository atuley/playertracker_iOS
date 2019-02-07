import Foundation

protocol SearchService {
    func getPlayerSearchResults(completionHandler: @escaping (PlayerSearchResult?, Error?) -> Void)
}

class PlayerSearchService: NSObject, SearchService, URLSessionDelegate {
    lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration,
                          delegate: self, delegateQueue: OperationQueue.main)
    }()
    
    func getPlayerSearchResults(completionHandler: @escaping (PlayerSearchResult?, Error?) -> Void) {
        let searchUrl = "http://127.0.0.1:4000/api/players"
        
        guard let request = URL(string: searchUrl) else { return }
        
        let dataTask = session.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                completionHandler(nil, error)
            }
            guard let data = data else { return }
            do {
                let searchResult = try JSONDecoder().decode(PlayerSearchResult.self, from: data)
                completionHandler(searchResult, error)
            }  catch let jsonError {
                completionHandler(nil, error)
                print("There was an error: ", jsonError)
            }
        }
        dataTask.resume()
        
    }
}
