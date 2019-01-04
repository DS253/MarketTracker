import Foundation
import UIKit

class DayTheme: ThemeProtocol
{
    var backgroundColor: UIColor
    var tabBarColor: UIColor
    var tabBarItemSelectedColor: UIColor
    var fontColor: UIColor
    var lineSeparatorColor: UIColor
    var statusBarStyle: UIBarStyle
    
    init()
    {
        backgroundColor = .white
        tabBarColor = .white
        tabBarItemSelectedColor = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
        fontColor = .black
        lineSeparatorColor = .black
        statusBarStyle = .default
    }
}
