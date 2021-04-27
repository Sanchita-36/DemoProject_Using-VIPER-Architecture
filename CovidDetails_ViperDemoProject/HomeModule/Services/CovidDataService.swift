//
//  CovidDataAPI.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 27/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//
import Foundation

typealias RegionClosure = (RegionResult) -> (Void)
protocol CovidDataAPIProtocol {
    func fetchRegions(completion: @escaping (RegionClosure)) -> (Void)
}

class CovidDataAPI {
    
    static let shared: CovidDataAPI = CovidDataAPI()
    private init() {}
}

extension CovidDataAPI: CovidDataAPIProtocol {
    func fetchRegions(completion: @escaping (RegionResult) -> (Void)) {
        
        DispatchQueue.main.async {
            let str = "https://api.apify.com/v2/key-value-stores/toDWvRj1JpTXiM8FF/records/LATEST?disableRedirect=true"
            
            let url = URL(string: str)
            
            URLSession.shared.dataTask(with: url!) { (data, response, error) in
                if error == nil {
                    do {
                        let regionAPIResult = try JSONDecoder().decode(RegionResult.self, from: data!)
                        completion(regionAPIResult)
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

