import Foundation

class URLBuilder
{
    // CoinMarketCap URLs
    static let baseUrl = "https://pro-api.coinmarketcap.com"
    static let latestListings = "/v1/cryptocurrency/listings/latest"
    static let coinImage = "https://s2.coinmarketcap.com/static/img/coins/64x64/"
    static let coinImageType = ".png"
    static let coinMetadata = "/v1/cryptocurrency/info"
    static let symbol = "?symbol="
    static let returnLimit = "?limit=5000"
    
    class func latestCoinsURL() -> String
    {
        return baseUrl + latestListings + returnLimit
    }
    
    class func coinLogoURL(coinID: Int) -> String
    {
        return coinImage + String(coinID) + coinImageType
    }
}
