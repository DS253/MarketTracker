import UIKit

class CommonTabBarViewController: UIViewController, ThemeUpdateProtocol
{
    var themeManager: ThemeManager?
    {
        return ThemeManager.sharedManager
    }
        
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        tabBarItem.title = tabBarTitle()
        tabBarItem.image = tabBarImage()
        tabBarItem.selectedImage = tabBarSelectedImage()
        navigationItem.title = tabBarTitle()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        updateTheme()
    }
    
    // MARK - ThemeUpdateProtocol Method
    func updateTheme()
    {
        updateTabBar()
        updateNavBar()
    }
    
    func updateNavBar()
    {
        navigationController?.navigationBar.barTintColor = themeManager?.selectedTheme.backgroundColor
        navigationController?.navigationBar.tintColor = themeManager?.selectedTheme.backgroundColor
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : themeManager?.selectedTheme.fontColor as Any]
        navigationController?.navigationBar.barStyle = (themeManager?.selectedTheme.statusBarStyle)!
    }
    
    func updateTabBar()
    {
        tabBarController?.tabBar.barTintColor = themeManager?.selectedTheme.tabBarColor
        tabBarController?.tabBar.backgroundColor = themeManager?.selectedTheme.tabBarColor
        tabBarController?.tabBar.tintColor = themeManager?.selectedTheme.tabBarItemSelectedColor
    }
    
    // TabBarVC Properties
    func tabBarTitle() -> String
    {
        fatalError("Child class must implement TabBar Title.")
    }
    
    func tabBarImage() -> UIImage
    {
        fatalError("Child class must implement TabBar Image.")
    }

    func tabBarSelectedImage() -> UIImage
    {
        fatalError("Child class must implement selected TabBar Image.")
    }
}
