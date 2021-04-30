//
//  CovidDataInteractor.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

protocol CovidDataInteractorProtocol {
    func getCovidData(completion: @escaping (RegionClosure)) -> (Void)
}

class CovidDataInteractor {
    var service: CovidDataAPI
    init(service: CovidDataAPI) {
        self.service = service
    }
}

extension CovidDataInteractor: CovidDataInteractorProtocol {
    func getCovidData(completion: @escaping (RegionResult) -> (Void)) {
        self.service.fetchRegions{ (result) in
            completion(result)
        }
    }
}
