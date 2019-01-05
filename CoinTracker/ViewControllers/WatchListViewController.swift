import UIKit

class WatchListViewController: CommonTabBarViewController
{
    internal var watchlist = [Coin]()
    @IBOutlet weak var watchlistTable: UITableView!
    @IBOutlet weak var emptyContainer: UIView!
    @IBOutlet weak var emptyLabel: UILabel!
    @IBOutlet weak var toWatchlistButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerCoinListingCells()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        displayEmptyView(watchlist.isEmpty ? false : true)
    }
    
    func displayEmptyView(_ display: Bool)
    {
        emptyContainer.isHidden = display
    }
    
    @IBAction func navigateToCoinListingView(_ sender: UIButton)
    {
        tabBarController?.selectedIndex = TabBarIndex.CoinListings
    }
    
    override func tabBarTitle() -> String
    {
        return NavBarTitle.Watchlist
    }
    
    override func tabBarImage() -> UIImage
    {
        return UIImage(named: TabImage.WatchlistTabGlyph)!
    }
    
    override func tabBarSelectedImage() -> UIImage
    {
        return UIImage(named: TabImage.WatchlistTabGlyph)!
    }
    
    
    // MARK - ThemeUpdateProtocol Method
    override func updateTheme()
    {
        super.updateTheme()
        watchlistTable.reloadData()
        watchlistTable.backgroundColor = themeManager?.selectedTheme.backgroundColor
        watchlistTable.separatorColor = themeManager?.selectedTheme.backgroundColor
        emptyContainer.backgroundColor = themeManager?.selectedTheme.backgroundColor
        emptyLabel.textColor = themeManager?.selectedTheme.fontColor
        toWatchlistButton.setTitleColor(themeManager?.selectedTheme.fontColor, for: UIControl.State.normal)
    }
}

// MARK - UITableViewDelegate, UITableViewDataSource
extension WatchListViewController: UITableViewDelegate, UITableViewDataSource
{
    func registerCoinListingCells()
    {
        watchlistTable.register(UINib.init(nibName: ViewIdentifiers.CoinListingsTableViewCell, bundle: nil), forCellReuseIdentifier: ViewIdentifiers.CoinListingsCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return watchlist.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifiers.CoinListingsCell, for: indexPath) as! CoinListingTableViewCell
        cell.delegate = self
        let coin = watchlist[indexPath.row]
        cell.set((themeManager?.selectedTheme)!)
        cell.populateWith(coin)
        cell.faveButton.isSelected = true
        
        return cell
    }
}

// MARK - Cell Delegate
extension WatchListViewController: CoinListCellDelegate
{
    func faveButtonPressed(_ sender: CoinListingTableViewCell)
    {
        if let indexPath = watchlistTable.indexPath(for: sender)
        {
            watchlist.remove(at: indexPath.row)
            watchlistTable.reloadData()
            displayEmptyView(watchlist.isEmpty ? false : true)
        }
    }
}

// MARK - Watchlist Update Protocol
extension WatchListViewController: WatchlistUpdateProtocol
{
    func addToWatchlist(_ coin: Coin)
    {
        watchlist.append(coin)
    }
    
    func removeFromWatchlist(_ coin: Coin)
    {
        if let row = watchlist.firstIndex(of: coin)
        {
            watchlist.remove(at: row)
            if let table = watchlistTable { table.reloadData() }
        }
    }
}
