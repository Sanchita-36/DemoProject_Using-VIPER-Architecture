//
//  CovidDataService.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 29/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import Foundation

typealias CovidDataClosure = (CovidDataResult) -> (Void)

protocol CovidDataServiceProtocol {
    func fetchData(completion: @escaping (CovidDataClosure)) -> (Void)
}


class CovidDataService {
    static let sharedData: CovidDataService = CovidDataService()
    private init() {}
}

extension CovidDataService: CovidDataServiceProtocol {

    func fetchData(completion: @escaping (CovidDataResult) -> (Void)) {
        DispatchQueue.main.async {
            let str = "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true"
            let url = URL(string: str)
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        let dataResult = try JSONDecoder().decode(CovidDataResult.self, from: data!)
                        completion(dataResult)
                    }catch {
                        print("Something went wrong")
                    }
                }else {
                    print("Error",error!)
                }
            }.resume()
        }
    }
}
