import UIKit

class NewsViewController: CommonTabBarViewController
{
    @IBOutlet weak var underConstructionLabel: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }

    override func tabBarTitle() -> String
    {
        return NavBarTitle.News
    }
    
    override func tabBarImage() -> UIImage
    {
        return UIImage(named: TabImage.NewsTabGlyph)!
    }
    
    override func tabBarSelectedImage() -> UIImage
    {
        return UIImage(named: TabImage.NewsTabGlyph)!
    }
    
    // MARK - ThemeUpdateProtocol Method
    override func updateTheme()
    {
        super.updateTheme()
        view.backgroundColor = themeManager?.selectedTheme.backgroundColor
        underConstructionLabel.backgroundColor = themeManager?.selectedTheme.backgroundColor
        underConstructionLabel.textColor = themeManager?.selectedTheme.fontColor
    }
}
