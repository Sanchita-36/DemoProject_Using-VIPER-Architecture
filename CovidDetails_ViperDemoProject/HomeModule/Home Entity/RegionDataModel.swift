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
}
