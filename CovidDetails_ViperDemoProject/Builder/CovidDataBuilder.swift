//
//  CovidDataBuilder.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

class CovidDataBuilder {
    
    static func build(regionBuilderData: String) -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewD = storyboard.instantiateViewController(identifier: "CovidDataViewController") as! CovidDataViewController
       // let viewR = CovidRegionDataViewController()
        viewD.title = regionBuilderData
        let viewString = regionBuilderData
        let interactorD = CovidDataInteractor(dataService: CovidDataService.sharedData)
        let routerD = CovidDataRouter(viewCD: viewD, viewString: viewString)
        let presenterD = CovidDataPresenter(viewData: viewD, interactorData: interactorD, routerData: routerD)
        viewD.presenterData = presenterD
        return viewD
    }
    
}
