import Foundation

protocol WatchlistUpdateProtocol: AnyObject
{
    var watchlist: [CoinModel] { get set }
    func addToWatchlist(_ coin: CoinModel)
    func removeFromWatchlist(_ coin: CoinModel)
}
