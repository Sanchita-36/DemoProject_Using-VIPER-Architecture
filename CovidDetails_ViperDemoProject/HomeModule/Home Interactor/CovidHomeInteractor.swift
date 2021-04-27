//
//  HomeInteractor.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

protocol CovidHomeInteractorProtocol {
    func getCity() -> [CovidHomeModel]
}

class CovidHomeInteractor {
    
}

extension CovidHomeInteractor: CovidHomeInteractorProtocol {
    func getCity() -> [CovidHomeModel] {
        return DataService.instance.covidCity
    }
}
