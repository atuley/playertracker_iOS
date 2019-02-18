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
    static let secondaryBlue = Utilities.convertHexToColor(hex: "245582")
    static let primaryGrey = Utilities.convertHexToColor(hex: "2D2D2D")
    static let primaryRed = Utilities.convertHexToColor(hex: "ff4242")
}

struct Fonts {
    static let robotoCondensed = "Roboto Condensed"
}

struct ButtonTitles {
    static let follow = "Follow"
    static let unfollow = "Unfollow"
}

struct ViewWidths {
    static let iphone5 = CGFloat(integerLiteral: 320)
    static let iphone6 = CGFloat(integerLiteral: 375)
    static let ipadAir = CGFloat(integerLiteral: 768)
}
