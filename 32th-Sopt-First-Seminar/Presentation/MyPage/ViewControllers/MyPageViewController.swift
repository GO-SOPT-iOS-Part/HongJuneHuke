//
//  MyPageViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

import SnapKit

final class MyPageViewController: BaseViewController {
    
    private let myPageTableView = MyPageTableView(frame: CGRect(), style: .grouped)
    private let backButton = BackButton(type: .system)
    private let myPageCoordinator: MyPageCoordinator?
    
    
    init(coordinator: MyPageCoordinator) {
        self.myPageCoordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTabelView()
    }
    
    override func render() {
        view.addSubview(myPageTableView)
        
        myPageTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    override func configUI() {
        view.backgroundColor = .black
    }
    
    private func setTabelView() {
        let superViewWidth = UIScreen.main.bounds.width
        let headView = MyPageHeaderView(frame: CGRect(x: 0, y: 0, width: superViewWidth, height: 300))
        myPageTableView.tableHeaderView = headView
    }
    
    override func setupNavigationBar() {
        super.setupNavigationBar()
        
        let backButton = makeBarButtonItem(with: backButton)
        
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.leftBarButtonItem = backButton
    }
}
