import UIKit

class Utilities {
    static func getImageFromUrl(url: URL) -> UIImage {
        let newUrl = useHttps(url: url)
        if let imageData = try? Data(contentsOf: newUrl) {
            return UIImage(data: imageData)!
        }
        return UIImage()
    }
    
    static func useHttps(url: URL) -> URL {
        return String(describing: url).range(of:"http:") != nil ? URL(string: String(describing: url).replacingOccurrences(of: "http:", with: "https:"))! : url
    }
    
    static func createImageGradient() -> CAGradientLayer {
        let screenWidth  = UIScreen.main.fixedCoordinateSpace.bounds.width
        
        let gradient = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 400)
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 5.0, y: 0.5)
        
        let startColor = uicolorFromHex(rgbValue: 0x2D2D2D)
        let endColor = UIColor.yellow
        
        gradient.colors = [startColor.cgColor, endColor.cgColor]
        
        return gradient
    }
    
    static func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
    
}
