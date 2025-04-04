import UIKit

class Utilities {
    static func getImageFromUrl(url: URL) -> UIImage {
        let newUrl = useHttps(url: url)
        if let imageData = try? Data(contentsOf: newUrl) {
            return UIImage(data: imageData)!
        }
        return UIImage(named: "placeholder")!
    }
    
    static func useHttps(url: URL) -> URL {
        return String(describing: url).range(of:"http:") != nil ? URL(string: String(describing: url).replacingOccurrences(of: "http:", with: "https:"))! : url
    }
    
    static func createImageGradient(player: Player) -> CAGradientLayer {
        let gradient = CAGradientLayer()
        
        // Set frame to match the cell size
        let screenWidth = UIScreen.main.bounds.width
        gradient.frame = CGRect(x: 0, y: 0, width: screenWidth, height: 100) // Match cell height
        
        // Create a horizontal gradient
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        
        // Convert team color and create gradient colors
        let teamColor = convertHexToColor(hex: player.teamColor ?? "#000000")
        
        // Create a darker gradient that will be more visible
        let startColor = Colors.primaryGrey
        let midColor = teamColor.withAlphaComponent(1.0)
        
        // Set gradient colors and locations
        gradient.colors = [
            startColor.cgColor,
            midColor.cgColor
        ]
        gradient.locations = [0.0, 1.0]
        
        return gradient
    }
    
    static func convertHexToColor(hex: String) -> UIColor {
        let hex = hex.replacingOccurrences(of: "#", with: "")
        
        var rgbValue:UInt32 = 0
        Scanner(string: hex).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
