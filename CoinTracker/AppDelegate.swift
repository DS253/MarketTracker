import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?
    var tabBarViewController = UITabBarController.init()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let coinListVC = CoinListingsViewController.init(nibName: ViewIdentifiers.CoinListingsVC,
                                                         bundle: nil,
                                                         cloudManager: CloudManager.sharedSession)
        let coinListNavController = UINavigationController(rootViewController: coinListVC)
        
        let watchListVC = WatchListViewController.init(nibName: ViewIdentifiers.WatchListVC, bundle: nil)
        let watchListNavController = UINavigationController(rootViewController: watchListVC)
        coinListVC.watchlistDelegate = watchListVC
        
        let newsVC = NewsViewController.init(nibName: ViewIdentifiers.NewsVC, bundle: nil)
        let newsNavController = UINavigationController(rootViewController: newsVC)
        
        let moreVC = MoreViewController.init(nibName: ViewIdentifiers.MoreVC, bundle: nil)
        let moreNavController = UINavigationController(rootViewController: moreVC)
        
        tabBarViewController.viewControllers = [coinListNavController, watchListNavController, newsNavController, moreNavController]
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = tabBarViewController
        window.makeKeyAndVisible()
        self.window = window
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}
