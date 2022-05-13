//
//  SubcriptionDetailVC.swift
//  subscribtion_box
//
//  Created by John Sag on 5/11/22.
//

import Foundation
import UIKit


class SubcriptionDetailVC: UIViewController {
     
    @IBOutlet weak var imageIcon: UIImageView!
    
    var model: SubscriptionModel? {
        didSet {
            updateUI()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func updateUI() {
        guard let model = model else {
            return
        }
//        imageIcon.image = model.image
//        titleLabel.text = model.title
    }
}
