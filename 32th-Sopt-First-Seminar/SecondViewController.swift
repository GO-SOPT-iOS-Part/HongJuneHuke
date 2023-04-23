//
//  SecondViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/22.
//

import UIKit

final class SecondViewController: UIViewController {
    
    private let originView = CommonView()
    
    override func loadView() {
        self.view = originView
    }
}
