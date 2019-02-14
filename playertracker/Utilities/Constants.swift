import Foundation
import UIKit

struct CellIdentifiers {
    static let searchCell = "SearchCell"
}

struct NibNames {
    static let searchCell = "SearchCell"
}

struct NavbarTitles {
    static let search = "Search"
}

struct XibHeights {
    static let search = 100
}

struct Colors {
    static let primaryBlue = Utilities.convertHexToColor(hex: "3375B1")
    static let primaryGrey = Utilities.convertHexToColor(hex: "#2D2D2D")
}

struct Fonts {
    static let robotoCondensed = "Roboto Condensed"
}

struct ButtonTitles {
    static let follow = "Follow"
}

struct ViewWidths {
    static let iphone5 = CGFloat(bitPattern: 320)
    static let iphone6 = CGFloat(bitPattern: 375)
    static let ipadAir = CGFloat(bitPattern: 768)
}
