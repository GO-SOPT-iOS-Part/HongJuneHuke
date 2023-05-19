//
//  WeatherView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/05/12.
//

import UIKit

final class WeatherTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupTableView() {
        register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.identifier)
        self.rowHeight = 70
        showsVerticalScrollIndicator = true
    }
}
