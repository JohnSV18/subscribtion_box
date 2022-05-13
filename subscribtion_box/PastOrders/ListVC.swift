//
//  ListVC.swift
//  subscribtion_box
//
//  Created by John Sag on 4/29/22.
//
//
import Foundation
import UIKit

class ListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .blue
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}
extension ListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        cell.backgroundColor = .brown
        return cell
    }
}
