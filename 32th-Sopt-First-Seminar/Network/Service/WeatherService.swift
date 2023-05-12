//
//  WeatherService.swift
//  32th-Sopt-First-Seminar
//
//  Created by 홍준혁 on 2023/05/12.
//

import Foundation

import Alamofire

final class WeatherService {
    
    static let shared = WeatherService()
    
    private init() {}
    
    func getWeatherAPI(
        location: String,
        completion: @escaping (NetworkResult<Any>) -> Void
    ) {
        
        let url = "BASEURL" + "/weather?q=\(location)&appid=APPID"
        let header: HTTPHeaders = ["Content-Type" : "application/json"]

        print(url)
        let dataRequest = AF.request(url,
                                     method: .post,
                                     encoding: JSONEncoding.default,
                                     headers: header)
        
        dataRequest.responseData { response in
            switch response.result {
            case .success:
                guard let statusCode = response.response?.statusCode else { return }
                guard let value = response.value else { return }
                let networkResult = self.judgeStatus(by: statusCode, value)
                completion(networkResult)
            case .failure:
                completion(.networkFail)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200: return isValidData(data: data)
        case 400, 409: return isValidData(data: data)
        case 500: return .serverErr
        default: return .serverErr
        }
    }
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        guard let decodedData = try? decoder.decode(WeatherReponse.self, from: data) else { return .pathErr }
        return .success(decodedData as Any)
    }
}
