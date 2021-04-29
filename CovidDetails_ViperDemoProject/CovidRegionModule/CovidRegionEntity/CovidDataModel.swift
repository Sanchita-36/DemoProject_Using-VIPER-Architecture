//
//  CovidDataModel.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

struct CovidDataResult: Codable {
    var regionData: [CovidData]
}

struct CovidData: Codable {
    var region: String
    var totalInfected: Int
    var newInfected: Int
    var recovered: Int
    var newRecovered: Int
    var deceased: Int
    var newDeceased: Int
}
