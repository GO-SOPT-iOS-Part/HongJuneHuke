//
//  WeatherViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/05/12.
//

import UIKit

final class WeatherViewController: BaseViewController {
    
    let tableView = WeatherTableView()
    var viewModel: WeatherViewModel?
    private var weatherData: [WeatherReponse]? {
        didSet {
            tableView.reloadData()
        }
    }
    private var cityList: [String] = [String]()
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.viewDidLoad()
        setNavigationBar()
    }
    
    func setNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }
    
    override func render() {
        view = tableView
    }
    
    private func bind() {
        tableView.dataSource = self
        viewModel?.weatherResponseDataOutput = { [weak self] result in
            self?.weatherData = result
        }
        viewModel?.cityListOutput = { [weak self] result in
            self?.cityList = result
        }
    }
}

extension WeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.identifier, for: indexPath) as? WeatherTableViewCell ?? WeatherTableViewCell()
        cell.selectionStyle = .none
        let index = indexPath.row
        if let data = weatherData?[index] {
            cell.binding(model: data, city: cityList[index])
            return cell
        }
        return cell
    }
}

