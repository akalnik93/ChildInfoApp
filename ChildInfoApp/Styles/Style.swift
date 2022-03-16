import UIKit

class Style {
    
    class Font: UIFont {
        
        open class func regular(_ size: CGFloat) -> UIFont {
            if let font = UIFont(name: "Palatino-Roman", size: size) {
                return font
            } else {
                return UIFont()
            }
        }
    }

}
