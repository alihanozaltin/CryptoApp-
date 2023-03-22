//
//  TableViewCell.swift
//  CryptoApp
//
//  Created by Alihan Özaltın on 22.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private let label: UILabel = UILabel()
    private let priceLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        self.backgroundColor = .clear
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    private func configure() {
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .red
        label.textAlignment = .left
        addSubview(label)
        
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(5)
        }
        
        priceLabel.font = .italicSystemFont(ofSize: 10)
        priceLabel.textColor = .blue
        priceLabel.textAlignment = .left
        addSubview(priceLabel)
        
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(label)
            make.top.equalTo(label.snp.bottom).offset(5)
            make.bottom.equalToSuperview().offset(-5)
        }
    }
    
    func fillWith(name:String,price:String){
        label.text = name
        priceLabel.text = price
    }
}
