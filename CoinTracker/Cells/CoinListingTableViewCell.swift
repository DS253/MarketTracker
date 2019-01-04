import UIKit
import FaveButton

class CoinListingTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var imageContainer: UIView!
    @IBOutlet weak var coinImage: UIImageView!
    @IBOutlet weak var coinSymbolLabel: UILabel!
    @IBOutlet weak var coinPriceLabel: UILabel!
    @IBOutlet weak var percentageChangeLabel: UILabel!
    @IBOutlet weak var faveButton: FaveButton!
    
    weak var delegate: CoinListCellDelegate?
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        faveButton.normalColor = .gray
        faveButton.selectedColor = .orange
        faveButton.isSelected = false
    }
    
    func populateWith(_ model: CoinModel)
    {
        coinSymbolLabel.text = model.symbol
        coinPriceLabel.text = Double.priceToString(number: model.price)
        percentageChangeLabel.text = Double.percentageToString(number: model.percentChangeDay)
        percentageChangeLabel.textColor = (0 > model.percentChangeDay) ? .red : .green
        coinImage.getCoinImage(with: model.logoURL)
    }
    
    func set(_ theme: ThemeProtocol)
    {
        contentView.backgroundColor = theme.backgroundColor
        imageContainer.backgroundColor = theme.backgroundColor
        coinSymbolLabel.backgroundColor = theme.backgroundColor
        coinSymbolLabel.textColor = theme.fontColor
        coinPriceLabel.backgroundColor = theme.backgroundColor
        coinPriceLabel.textColor = theme.fontColor
        percentageChangeLabel.backgroundColor = theme.backgroundColor
        percentageChangeLabel.textColor = theme.fontColor
    }

    @IBAction func faveButtonTapped(_ sender: FaveButton)
    {
        delegate?.faveButtonPressed(self)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
