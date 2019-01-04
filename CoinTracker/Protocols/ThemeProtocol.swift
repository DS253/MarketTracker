import Foundation
import UIKit

protocol ThemeProtocol
{
    var backgroundColor: UIColor { get set }
    var tabBarColor: UIColor { get set }
    var tabBarItemSelectedColor: UIColor { get set }
    var fontColor: UIColor { get set }
    var lineSeparatorColor: UIColor { get set }
    var statusBarStyle: UIBarStyle { get set }
}
