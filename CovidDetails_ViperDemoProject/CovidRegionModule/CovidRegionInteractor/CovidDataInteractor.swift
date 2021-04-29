//
//  CovidDataInteractor.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

protocol CovidDataInteractorProtocol {
    func getCovidData(completion: @escaping (CovidDataClosure)) -> (Void)
}

class CovidDataInteractor {
    var dataService: CovidDataService
    init(dataService: CovidDataService) {
        self.dataService = dataService
    }
}

extension CovidDataInteractor: CovidDataInteractorProtocol {
    func getCovidData(completion: @escaping (CovidDataResult) -> (Void)) {
        self.dataService.fetchData { (result) in
            completion(result)
        }
    }
}
