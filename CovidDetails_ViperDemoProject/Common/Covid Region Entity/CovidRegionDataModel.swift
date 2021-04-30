//
//  CovidRegionModel.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 27/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

struct RegionResult: Codable {
    var regionData: [Region]
}

struct Region: Codable {
    var region: String
    var totalInfected: Int
    var newInfected: Int
    var recovered: Int
    var newRecovered: Int
    var deceased: Int
    var newDeceased: Int
}
