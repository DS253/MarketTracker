import UIKit

class CoinListingsViewController: CommonTabBarViewController, CoinListServiceProtocol
{
    private var coinList = [CoinModel]()
    internal var cloudManager: CloudManager?
    weak var watchlistDelegate: WatchlistUpdateProtocol?
    
    @IBOutlet weak var coinTableView: UITableView!
    
    required init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, cloudManager: CloudManager)
    {
        self.cloudManager = cloudManager
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.cloudManager!.getCoinList { (model) in
            if let list = model
            {
                self.coinList = list
                self.coinTableView.reloadData()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        registerCoinListingCells()
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
    }
    
    override func tabBarTitle() -> String
    {
        return NavBarTitle.Coins
    }
    
    override func tabBarImage() -> UIImage
    {
        return UIImage(named: TabImage.CoinsTabGlyph)!
    }
    
    override func tabBarSelectedImage() -> UIImage
    {
        return UIImage(named: TabImage.CoinsTabGlyph)!
    }
    
    // MARK - ThemeUpdateProtocol Method
    override func updateTheme()
    {
        super.updateTheme()
        coinTableView.reloadData()
        coinTableView.backgroundColor = themeManager?.selectedTheme.backgroundColor
        coinTableView.separatorColor = themeManager?.selectedTheme.backgroundColor
    }
}

// MARK - UITableViewDelegate, UITableViewDataSource
extension CoinListingsViewController: UITableViewDelegate, UITableViewDataSource
{
    func registerCoinListingCells()
    {
        coinTableView.register(UINib.init(nibName: ViewIdentifiers.CoinListingsTableViewCell, bundle: nil), forCellReuseIdentifier: ViewIdentifiers.CoinListingsCell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return coinList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewIdentifiers.CoinListingsCell, for: indexPath) as! CoinListingTableViewCell
        cell.delegate = self
        let coinModel = coinList[indexPath.row]
        cell.set((themeManager?.selectedTheme)!)
        cell.populateWith(coinModel)
        
        cell.faveButton.isSelected = watchlistDelegate?.watchlist.contains(coinModel) ?? false
        
        return cell
    }
}

// MARK - Cell Delegate
extension CoinListingsViewController: CoinListCellDelegate
{
    func faveButtonPressed(_ sender: CoinListingTableViewCell)
    {
        let indexPath = coinTableView.indexPath(for: sender)
        if let index = indexPath
        {
            if sender.faveButton.isSelected
            {
                watchlistDelegate?.addToWatchlist(coinList[index.row])
            }
            else
            {
                watchlistDelegate?.removeFromWatchlist(coinList[index.row])
            }
        }
    }
}
