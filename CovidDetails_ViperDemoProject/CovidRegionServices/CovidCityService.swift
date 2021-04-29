//
//  CovidCityService.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

class DataService {
    static var instance = DataService()
    
    var covidCity = [
        CovidHomeModel(cityTitle: "Pune"),
        CovidHomeModel(cityTitle: "Aurangabad"),
        CovidHomeModel(cityTitle: "Mumbai"),
        CovidHomeModel(cityTitle: "Goa")
    ]
}
