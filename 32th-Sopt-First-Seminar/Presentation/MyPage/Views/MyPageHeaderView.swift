//
//  MyPageHeaderView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

import SnapKit

final class MyPageHeaderView: BaseUIView {
    
    // MARK: - property
    
    private let contentView = UIView()

    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.bearIcon
        imageView.layer.cornerRadius = 15
        return imageView
    }()
    
    private let nameTextLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.pretendardMedium
        label.text = TextLiteral.userName
        label.textColor = .white
        return label
    }()
    
    private let profileChangeButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextLiteral.profileChangeButtonText, for: .normal)
        button.layer.cornerRadius = 3
        return button
    }()
    
    private let ticketCoinGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = .tvingGray5
        return view
    }()
    
    private let ticketImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.ticketIcon
        return imageView
    }()
    
    private let ticketLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.pretendardMedium
        label.text = TextLiteral.ticketLabel
        label.textColor = .tvingGray3
        return label
    }()
    
    private let ticketStatusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.pretendardMedium
        label.text = TextLiteral.ticketStatusLabel
        label.textColor = .tvingGray3
        return label
    }()
    
    private let coinImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageLiteral.coinIcon
        return imageView
    }()
    
    private let coinLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.pretendardMedium
        label.text = TextLiteral.coinLabel
        label.textColor = .tvingGray3
        return label
    }()
    
    private let coinStatusLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.pretendardBold
        label.text = TextLiteral.coinStatusLabel
        label.textColor = .tvingWhite
        return label
    }()
    
    private let bottomGrayView: UIView = {
        let view = UIView()
        view.backgroundColor = .tvingGray5
        return view
    }()
    
    private let moreDetailLabel: UILabel = {
        let label = UILabel()
        let firstAttributedString = NSMutableAttributedString(string: TextLiteral.firstAttributedString)
        let firstImageAttachment = NSTextAttachment()
        firstImageAttachment.image = ImageLiteral.tvingIcon
        firstImageAttachment.bounds = CGRect(x: 0, y: 0, width: 25, height: 10)
        firstAttributedString.append(NSAttributedString(attachment: firstImageAttachment))
        
        let secondAttributedString = NSMutableAttributedString(string: TextLiteral.secondAttributedString)
        firstAttributedString.append(secondAttributedString)
        let thirdAttributedString = NSMutableAttributedString(string: TextLiteral.thirdAttributedString)
        firstAttributedString.append(thirdAttributedString)
        
        label.attributedText = firstAttributedString
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = UIFont.pretendardSemiBold
        label.textColor = .tvingGray2
        return label
    }()
    
    let moreDetailButton: UIButton = {
        let button = UIButton()
        button.setImage(ImageLiteral.detailButton, for: .normal)
        return button
    }()
    
    override func render() {
        ticketCoinGrayView.addSubviews(
            ticketImageView,
            ticketLabel,
            ticketStatusLabel,
            coinImageView,
            coinLabel,
            coinStatusLabel
        )
        
        bottomGrayView.addSubviews(
            moreDetailLabel,
            moreDetailButton
        )
        
        contentView.addSubviews(
            userImageView,
            nameTextLabel,
            profileChangeButton,
            ticketCoinGrayView,
            bottomGrayView
        )
        
        self.addSubview(contentView)
        
        // MARK: - View
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    
        userImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(24)
            $0.height.equalTo(74)
            $0.width.equalTo(72)
        }
        
        nameTextLabel.snp.makeConstraints {
            $0.centerY.equalTo(userImageView)
            $0.leading.equalTo(userImageView.snp.trailing).offset(22)
        }
        
        profileChangeButton.snp.makeConstraints {
            $0.centerY.equalTo(userImageView)
            $0.trailing.equalToSuperview().inset(23)
            $0.height.equalTo(25)
        }
        
        ticketCoinGrayView.snp.makeConstraints {
            $0.top.equalTo(userImageView.snp.bottom).offset(30)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(92)
        }
        
        bottomGrayView.snp.makeConstraints {
            $0.top.equalTo(ticketCoinGrayView.snp.bottom).offset(12)
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(60)
        }
        
        // MARK: - ticketCoinGrayView
        
        ticketImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalToSuperview().offset(11)
            $0.height.width.equalTo(23)
        }
        
        ticketLabel.snp.makeConstraints {
            $0.centerY.equalTo(ticketImageView)
            $0.leading.equalTo(ticketImageView.snp.trailing).offset(5)
        }
        
        ticketStatusLabel.snp.makeConstraints {
            $0.centerY.equalTo(ticketImageView)
            $0.trailing.equalToSuperview().inset(13)
        }
        
        coinImageView.snp.makeConstraints {
            $0.top.equalTo(ticketImageView.snp.bottom).offset(17)
            $0.leading.equalToSuperview().offset(11)
            $0.height.width.equalTo(23)
        }
        
        coinLabel.snp.makeConstraints {
            $0.centerY.equalTo(coinImageView)
            $0.leading.equalTo(coinImageView.snp.trailing).offset(5)
        }
        
        coinStatusLabel.snp.makeConstraints {
            $0.centerY.equalTo(coinImageView)
            $0.trailing.equalToSuperview().inset(11)
        }
        
        // MARK: - bottomGrayView
        
        moreDetailLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(11)
            $0.leading.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().inset(75)
        }
        
        moreDetailButton.snp.makeConstraints {
            $0.centerY.equalTo(moreDetailLabel)
            $0.height.width.equalTo(17)
            $0.trailing.equalToSuperview().inset(13)
        }
    }
}
