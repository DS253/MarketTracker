import Foundation
import SwiftyJSON
import Realm
import RealmSwift

class Coin : Object
{
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var symbol = ""
    @objc dynamic var slug = ""
    @objc dynamic var circulatingSupply = 0
    @objc dynamic var totalSupply = 0
    @objc dynamic var maxSupply = 0
    @objc dynamic var price = 0.0
    @objc dynamic var volume = 0.0
    @objc dynamic var percentChangeHour = 0.0
    @objc dynamic var percentChangeDay = 0.0
    @objc dynamic var percentChangeWeek = 0.0
    @objc dynamic var marketCap = 0.0
    @objc dynamic var logoURL = ""
    
    init(data: JSON)
    {
        super.init()
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
    
    required init()
    {
        super.init()
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        fatalError("init(realm:schema:) has not been implemented")
    }
    
    required init(value: Any, schema: RLMSchema) {
        fatalError("init(value:schema:) has not been implemented")
    }
    
    // MARK - Equatable Protocol Method
    static func == (lhs: Coin, rhs: Coin) -> Bool
    {
        return (lhs.symbol == rhs.symbol) && (lhs.name == rhs.name)
    }
}

extension Coin
{
    class func parseCoinData(data: JSON) -> [Coin]?
    {
        var arrayOfCoins = [Coin]()
        if let dataArray = data["data"].array
        {
            for index in 0...dataArray.count - 1
            {
                let currentCoin = Coin(data: dataArray[index])
                arrayOfCoins.append(currentCoin)
            }
        }
        return arrayOfCoins
    }
    
    class func getCoinSymbols(coins: [Coin]) -> [String]
    {
        var symbolNames = [String]()
        
        for index in 0...coins.count - 1
        {
            symbolNames.append(coins[index].symbol)
        }
        return symbolNames
    }
}
