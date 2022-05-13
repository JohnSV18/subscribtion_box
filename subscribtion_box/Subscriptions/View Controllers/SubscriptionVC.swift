//
//  SubscriptionVC.swift
//  subscribtion_box
//
//  Created by John Sag on 4/29/22.
//

import UIKit

struct SubscriptionModel {
    let image: UIImage
    let title: String
}

class SubscriptionVC: UIViewController {

    var data: [SubscriptionModel] = [
        SubscriptionModel(image: #imageLiteral(resourceName: "gymGold"), title: "Gym Gold"),
        SubscriptionModel(image: #imageLiteral(resourceName: "generalGym"), title: "General Gym"),
        SubscriptionModel(image: #imageLiteral(resourceName: "spaCare"), title: "Spa Care"),
        SubscriptionModel(image: #imageLiteral(resourceName: "saunaCare"), title: "Sauna Care"),
        SubscriptionModel(image: #imageLiteral(resourceName: "dayCare"), title: "Day Care"),
        SubscriptionModel(image: #imageLiteral(resourceName: "personalTrainer"), title: "Personal Trainer")
    ]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "SubscriptionCell", bundle: nil), forCellWithReuseIdentifier: SubscriptionCell.reuseIdentifier)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        tabBarItem.image = #imageLiteral(resourceName: "calendar").withRenderingMode(.alwaysOriginal)
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        tabBarItem.setTitleTextAttributes(attributes, for: .normal)
        tabBarItem.title = "Subscriptions"
        tabBarItem.imageInsets = .init(top: 35, left: 35, bottom: 35, right: 35)
    }

}

extension SubscriptionVC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "SubcriptionDetailVC") as? SubcriptionDetailVC else { return }
        vc.model = data[indexPath.item]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SubscriptionCell.reuseIdentifier, for: indexPath) as! SubscriptionCell
        cell.model = data[indexPath.item]
        return cell
    }
}

extension SubscriptionVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 4, height: collectionView.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 15, bottom: 10, right: 15)
    }
}
