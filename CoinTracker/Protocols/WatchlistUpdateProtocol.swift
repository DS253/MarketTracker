import Foundation

protocol WatchlistUpdateProtocol: AnyObject
{
    var watchlist: [Coin] { get set }
    func addToWatchlist(_ coin: Coin)
    func removeFromWatchlist(_ coin: Coin)
}
