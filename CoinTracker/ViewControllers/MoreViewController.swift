import UIKit

class MoreViewController: CommonTabBarViewController
{
    @IBOutlet weak var moreTableView: UITableView!
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerMoreCells()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
    }

    override func tabBarTitle() -> String
    {
        return NavBarTitle.More
    }
    
    override func tabBarImage() -> UIImage
    {
        return UIImage(named: TabImage.MoreTabGlyph)!
    }
    
    override func tabBarSelectedImage() -> UIImage
    {
        return UIImage(named: TabImage.MoreTabGlyph)!
    }
    
    // MARK - ThemeUpdateProtocol Method
    override func updateTheme()
    {
        super.updateTheme()
        moreTableView.reloadData()
        moreTableView.backgroundColor = themeManager?.selectedTheme.backgroundColor
        moreTableView.separatorColor = themeManager?.selectedTheme.backgroundColor
    }
}

extension MoreViewController: UITableViewDelegate, UITableViewDataSource
{
    func registerMoreCells()
    {
        moreTableView.register(UINib.init(nibName: ViewIdentifiers.MoreTableViewCell, bundle: nil), forCellReuseIdentifier: ViewIdentifiers.MoreCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifiers.MoreCell, for: indexPath) as! MoreTableViewCell
        cell.textLabel?.text = themeManager?.selectedTheme is DayTheme ? Text.SetNightTheme : Text.SetDayTheme
        cell.set((themeManager?.selectedTheme)!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        themeManager?.switchCurrentTheme()
        updateTheme()
    }
}
