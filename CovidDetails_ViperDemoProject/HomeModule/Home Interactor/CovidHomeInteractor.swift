//
//  HomeInteractor.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

protocol CovidHomeInteractorProtocol {
    func getRegionData(completion: @escaping (RegionClosure)) -> (Void)
    //func getCity() -> [CovidHomeModel]  - Use this in case you consider CovidCityService.swift
}

class CovidHomeInteractor {
    var service: CovidDataAPI
    init(service: CovidDataAPI) {
        self.service = service
    }
}

extension CovidHomeInteractor: CovidHomeInteractorProtocol {
    /* Use this in case you consider CovidCityService.swift
     func getCity() -> [CovidHomeModel] {
     return DataService.instance.covidCity
     }*/
    
    func getRegionData(completion: @escaping (RegionResult) -> (Void)) {
        self.service.fetchRegions { (result) in
            completion(result)
        }
    }
}
