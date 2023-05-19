//
//  KeywordsTableViewCell.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/05/12.
//

import UIKit

import SnapKit

final class WeatherTableViewCell: BaseTableViewCell {
    
    static let identifier = "WeatherTableViewCell"

    let imgView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "cloud.sun.rain")?.withRenderingMode(.alwaysOriginal)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    let cityTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont(name: "Avenir-Black", size: 14)
        return title
    }()
    let currentTemper: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 10)
        return label
    }()
    let humidity: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Black", size: 10)
        return label
    }()

    // MARK: - life cycle
    
    override func render() {
        self.addSubviews(
            imgView,
            cityTitle,
            currentTemper,
            humidity
        )
        
        imgView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.height.width.equalTo(50)
            $0.leading.equalToSuperview().offset(15)
        }
        
        cityTitle.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(15)
        }
        
        currentTemper.snp.makeConstraints {
            $0.top.equalTo(cityTitle.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(15)
        }
        
        humidity.snp.makeConstraints {
            $0.top.equalTo(currentTemper.snp.bottom).offset(5)
            $0.trailing.equalToSuperview().inset(15)
        }
    }
}

extension WeatherTableViewCell {
    public func binding(model: WeatherReponse, city: String){
        cityTitle.text = city
        if let humidity = model.main?.humidity {
            self.humidity.text = "습도 : \(String(describing: humidity))"
        }
        if let temp = model.main?.temp {            
            self.currentTemper.text = "현재 온도 : \(String(describing: temp))도씨"
        }
    }
}
