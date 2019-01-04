import UIKit

class MoreTableViewCell: UITableViewCell
{
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    func set(_ theme: ThemeProtocol)
    {
        contentView.backgroundColor = theme.backgroundColor
        textLabel?.textColor = theme.fontColor
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}
