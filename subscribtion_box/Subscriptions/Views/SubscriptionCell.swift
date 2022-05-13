//
//  SubscriptionCell.swift
//  subscribtion_box
//
//  Created by John Sag on 5/11/22.
//

import UIKit

class SubscriptionCell: UICollectionViewCell {

    // MARK: IBOutlets
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: Constants
    static let reuseIdentifier: String = {
        return "SubscriptionCell"
    }()
    
    var model: SubscriptionModel? {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI() {
        guard let model = model else {
            return
        }
        iconImage.image = model.image
        titleLabel.text = model.title
    }
}
