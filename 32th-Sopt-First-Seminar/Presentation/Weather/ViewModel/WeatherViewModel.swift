//
//  WeatherViewModel.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/05/12.
//

import Foundation

protocol WeatherViewModelInput {
    func viewDidLoad()
}

protocol WeatherViewModelOutput {
    var weatherResponseDataOutput: (([WeatherReponse]) -> Void)? { get set }
    var cityListOutput: (([String]) -> Void)? { get set }
}

protocol WeatherViewModelInputOutput: WeatherViewModelInput, WeatherViewModelOutput {}

final class WeatherViewModel: WeatherViewModelInputOutput {

    private let cityList: [String] = ["gongju", "gwangju", "gumi", "gunsan", "daegu", "daejeon", "mokpo", "busan", "seosan", "seoul", "sokcho", "suwon", "suncheon", "ulsan", "iksan", "jeonju", "jeju", "cheonan", "cheongju", "chuncheon"]
    var cityWeatherList: [WeatherReponse] = [WeatherReponse]() {
        didSet {
            checkCityWeatherListFull()
        }
    }
    // MARK: - Input
    
    func viewDidLoad() {
        getCityWeatherList()
        if let cityListOutput = cityListOutput {
            cityListOutput(cityList)
        }
    }
    
    // MARK: - Output
    
    var weatherResponseDataOutput: (([WeatherReponse]) -> Void)?
    var cityListOutput: (([String]) -> Void)?
    
    // MARK: - func
    
    private func getCityWeatherList() {
        for city in cityList {
            getWeatherFromServer(location: city)
        }
    }
    
    func getWeatherFromServer(location: String) {
        getWeather(location: location) { [weak self] result in
            self?.cityWeatherList.append(result)
        }
    }
    
    func checkCityWeatherListFull() {
        if cityWeatherList.count == 20 {
            print("Hi")
            if let weatherResponseDataOutput = weatherResponseDataOutput {                weatherResponseDataOutput(cityWeatherList)
            }
        }
    }
}

// MARK: - API

private extension WeatherViewModel {
    func getWeather(
        location: String,
        completion: @escaping (WeatherReponse) -> Void
    ) {
        WeatherService.shared.getWeatherAPI(location: location) { result in
            switch result {
            case .success(let response):
                guard let weather = response as? WeatherReponse else { return }
                completion(weather)
            case .requestErr(let errResponse):
                dump(errResponse)
            default:
                print("error")
            }
        }
    }
}
