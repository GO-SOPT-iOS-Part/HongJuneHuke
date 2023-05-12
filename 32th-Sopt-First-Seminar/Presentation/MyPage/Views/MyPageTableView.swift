//
//  MyPageTableView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

import SnapKit

final class MyPageTableView: UITableView {
    
    private let splitLineView: UIView = {
        let view = UIView()
        view.backgroundColor = .tvingGray4
        view.snp.makeConstraints {
            $0.width.equalTo(UIScreen.main.bounds.width - 16)
            $0.height.equalTo(2)
        }
        return view
    }()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
        setTableHeaderFooterView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    private func setupTableView() {
        register(MyPageTableCell.self, forCellReuseIdentifier: MyPageTableCell.cellId)
        dataSource = self
        delegate = self
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        backgroundColor = .black
    }
    
    private func setTableHeaderFooterView() {
        let superViewWidth = UIScreen.main.bounds.width
        let headView = MyPageHeaderView(frame: CGRect(x: 0, y: 0, width: superViewWidth, height: 300))
        let footerview = MyPageFooterView(frame: CGRect(x: 0, y: 0, width: superViewWidth, height: 100))
        self.tableHeaderView = headView
        self.tableFooterView = footerview
    }
}

extension MyPageTableView: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return TextLiteral.tableViewFirstSectionTextArray.count
        case 1:
            return TextLiteral.tableViewSecoondSectionTextArray.count
        default: return Int()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: MyPageTableCell.cellId, for: indexPath) as! MyPageTableCell
        let section = indexPath.section
        let row = indexPath.row
        if section == 0 {
            cell.cellLabel.text = TextLiteral.tableViewFirstSectionTextArray[row]
        } else {
            cell.cellLabel.text = TextLiteral.tableViewSecoondSectionTextArray[row]
        }
        cell.selectionStyle = .none
        return cell
    }
}

extension MyPageTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 5))
        headerView.backgroundColor = .black
        if section == 1 {
            let lineView = splitLineView
            headerView.addSubview(lineView)
        }
        return headerView
    }
}
