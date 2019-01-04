import Foundation

protocol ThemeUpdateProtocol
{
    var themeManager: ThemeManager? { get }
    
    func updateTheme()
}
