import Foundation

protocol WebServiceProtocol
{
    var cloudManager: CloudManager? { get set }
}

protocol CoinListServiceProtocol: WebServiceProtocol
{
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?, cloudManager: CloudManager)
}
