import Foundation
import SwiftyJSON

class CoinModel
{
    var id = 0
    var name = ""
    var symbol = ""
    var slug = ""
    var circulatingSupply = 0
    var totalSupply = 0
    var maxSupply = 0
    var price = 0.0
    var volume = 0.0
    var percentChangeHour = 0.0
    var percentChangeDay = 0.0
    var percentChangeWeek = 0.0
    var marketCap = 0.0
    var logoURL = ""
    
    init(data: JSON)
    {
        id = data["id"].intValue
        name = data["name"].stringValue
        symbol = data["symbol"].stringValue
        slug = data["slug"].stringValue
        circulatingSupply = data["circulating_supply"].intValue
        totalSupply = data["total_supply"].intValue
        maxSupply = data["max_supply"].intValue
        logoURL = URLBuilder.coinLogoURL(coinID: id)
        
        let priceData = data["quote"]["USD"]
        price = priceData["price"].doubleValue
        volume = priceData["volume_24h"].doubleValue
        percentChangeHour = priceData["percent_change_1h"].doubleValue
        percentChangeDay = priceData["percent_change_24h"].doubleValue
        percentChangeWeek = priceData["percent_change_7d"].doubleValue
        marketCap = priceData["market_cap"].doubleValue
    }
}

extension CoinModel
{
    class func parseCoinModel(data: JSON) -> [CoinModel]?
    {
        var arrayOfCoins = [CoinModel]()
        if let dataArray = data["data"].array
        {
            for index in 0...dataArray.count - 1
            {
                let currentCoin = CoinModel(data: dataArray[index])
                arrayOfCoins.append(currentCoin)
            }
        }
        return arrayOfCoins
    }
    
    class func getCoinSymbols(coins: [CoinModel]) -> [String]
    {
        var symbolNames = [String]()
        
        for index in 0...coins.count - 1
        {
            symbolNames.append(coins[index].symbol)
        }
        return symbolNames
    }
}

extension CoinModel: Equatable
{
    static func == (lhs: CoinModel, rhs: CoinModel) -> Bool
    {
        return (lhs.symbol == rhs.symbol) && (lhs.name == rhs.name)
    }
}
