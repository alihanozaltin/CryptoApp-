//
//  ViewController.swift
//  CryptoApp
//
//  Created by Alihan Özaltın on 22.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        return cell
    }
    
    
    let tableView : UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
       configure()
    }
    private func configure() {
        view.addSubview(tableView)
        //tableView.delegate = self
        //tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
    }
}


