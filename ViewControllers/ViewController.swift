//
//  ViewController.swift
//  CryptoApp
//
//  Created by Alihan Özaltın on 22.03.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    private var cryptoListViewModel: CryptoListViewModel!
    let tableView : UITableView = UITableView()
    private var indicator : UIActivityIndicatorView = UIActivityIndicatorView()

    override func viewDidLoad() {
        super.viewDidLoad()
        showActivityIndicator()
        getData()
    }
    
    private func getData() {
              
         let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
         
         Webservice().downloadCurrencies(url: url) { cryptos in
             if let cryptos = cryptos {
                 self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                 DispatchQueue.main.async {
                     self.hideActivityIndicator()
                     self.makeUI()
                 }
             }
         }
         
     }
        
     
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let data = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.fillWith(name: data.name, price: data.price)
        return cell
    }
    
    
    
    private func makeUI(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: "cell")
        self.tableView.backgroundColor = .white
        view.addSubview(tableView)
        self.tableView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.top.equalToSuperview()
        }
    }
    
    func showActivityIndicator() {
        indicator = UIActivityIndicatorView(style: .large)
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }

    func hideActivityIndicator(){
        if (indicator != nil){
            indicator.stopAnimating()
        }
    }
    
}
