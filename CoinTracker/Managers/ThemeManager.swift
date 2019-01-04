import Foundation
import UIKit

final class ThemeManager
{
    static let sharedManager = ThemeManager()
    
    // Night Theme is by default until persistence is implemented
    var selectedTheme: ThemeProtocol = NightTheme()
        
    func switchCurrentTheme()
    {
        selectedTheme = selectedTheme is DayTheme ? NightTheme() : DayTheme()
    }
}
