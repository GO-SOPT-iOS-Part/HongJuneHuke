//
//  MyPageTableView.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/04/25.
//

import UIKit

final class MyPageTableView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupTableView()
    }
    
    private func setupTableView() {
        register(MyPageTableCell.self, forCellReuseIdentifier: MyPageTableCell.cellId)
        dataSource = self
        separatorStyle = .none
        showsVerticalScrollIndicator = false
        backgroundColor = .black
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
