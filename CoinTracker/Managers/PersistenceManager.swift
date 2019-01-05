import Foundation
import RealmSwift

final class PersistenceManager
{
    static let sharedManager = PersistenceManager()
    let realm = try! Realm()
    
    func save(coins: CoinModel)
    {
        do {
            try realm.write {
                realm.add(coins)
            }
        } catch {
            print("Error saving Coins \(error)")
        }
    }
}
