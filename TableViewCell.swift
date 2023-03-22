//
//  TableViewCell.swift
//  CryptoApp
//
//  Created by Alihan Özaltın on 22.03.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let label: UILabel = UILabel()
    let priceLabel: UILabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implement")
    }
    
    private func configure() {
        addSubview(label)
        addSubview(priceLabel)
        label.font = .boldSystemFont(ofSize: 18)
        priceLabel.font = .italicSystemFont(ofSize: 10)
        label.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview()
            }
        priceLabel.snp.makeConstraints { make in
            make.left.equalTo(label)
            make.top.equalTo(label).offset(-5)
        }
    }

}
