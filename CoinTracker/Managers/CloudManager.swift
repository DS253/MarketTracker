import Foundation
import Alamofire
import SwiftyJSON

final class CloudManager
{
    static let sharedSession = CloudManager()
    fileprivate let header: HTTPHeaders =
    [
        "X-CMC_PRO_API_KEY" : key,
                   "Accept" : "application/json"
    ]
    
    func getCoinList(completionHandler: @escaping ([CoinModel]?) -> Void)
    {
        Alamofire.request(URLBuilder.latestCoinsURL(), method: .get, headers: header).responseJSON {
            response in
            if response.result.isSuccess
            {
                let coinJSON = JSON(response.result.value!)
                completionHandler(CoinModel.parseCoinModel(data: coinJSON))
            }
            else
            {
                print("Error \(String(describing: response.result.error))")
                completionHandler(nil)
            }
        }
    }
    
// MARK - This worked until I made a couple changes in the helper methods to parse the data. Commented out until
//        app design decisions are made.
    
//    func getCoinMetadata(coinList: [CoinModel], onCompletion: @escaping (Bool) -> Void)
//    {
//        let coinSymbols = CoinModel.getCoinSymbols(coins: coinList)
//        let url = URLBuilder.coinMetadataURL(symbols: coinSymbols)
//        Alamofire.request(url, method: .get).responseJSON {
//            response in
//            if response.result.isSuccess
//            {
//                let metadata = JSON(response.result.value!)
//
//                let coinDictionary = metadata["data"].dictionaryValue
//
//                for coin in coinList
//                {
//                    if let coinData = coinDictionary[coin.symbol]
//                    {
//                        coin.addMetadata(data: coinData)
//                    }
//
//                }
//                onCompletion(true)
//            }
//            else
//            {
//                print("Error \(String(describing: response.result.error))")
//                onCompletion(true)
//            }
//        }
//    }
}
