import UIKit
import AlamofireImage

extension UIImageView
{
    func getCoinImage(with url: String)
    {
        let url = URL(string: url)
        self.af_setImage(withURL: url!)
    }
}
