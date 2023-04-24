//
//  MyPageTableCell.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

import SnapKit

final class MyPageTableCell: BaseTableViewCell {
    
    static let cellId = "CellId"
    
    // MARK: - property

    let cellLabel: UILabel = {
        let label = UILabel()
        label.textColor = .tvingGray2
        label.font = UIFont.pretendardMedium
        return label
    }()
    private let cellChevron: UIImageView = {
        let image = UIImageView()
        image.image = ImageLiteral.detailButton
        return image
    }()

    // MARK: - life cycle
    
    override func configUI() {
        self.backgroundColor = .black
    }
    
    override func render() {
        self.addSubviews(
            cellLabel,
            cellChevron
        )
        
        cellLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(18)
        }
        
        cellChevron.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(18)
            $0.height.width.equalTo(17)
        }
    }
}
