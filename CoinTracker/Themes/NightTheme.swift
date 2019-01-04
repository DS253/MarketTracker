import Foundation
import UIKit

class NightTheme: ThemeProtocol
{
    var backgroundColor: UIColor
    var tabBarColor: UIColor
    var tabBarItemSelectedColor: UIColor
    var fontColor: UIColor
    var lineSeparatorColor: UIColor
    var statusBarStyle: UIBarStyle
    
    init()
    {
        backgroundColor = .black
        tabBarColor = .black
        tabBarItemSelectedColor = UIColor(red: 251.0 / 255.0, green: 199.0 / 255.0, blue: 99.0 / 255.0, alpha: 1.0)
        fontColor = .white
        lineSeparatorColor = .white
        statusBarStyle = .blackTranslucent
    }
}
