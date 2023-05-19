//
//  BaseTableViewCell.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/05/12.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        render()
        configUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func render() {}
    
    func configUI() {}
}
