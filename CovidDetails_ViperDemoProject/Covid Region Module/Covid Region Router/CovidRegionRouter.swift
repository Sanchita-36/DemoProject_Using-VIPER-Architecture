//
//  HomeRouter.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//
import UIKit

protocol CovidRegionRouterProtocol {
    func presenterToRouterRegionSelection(presenterToRouterRegionSelectionData: String)
}

class CovidRegionRouter {
    var viewController: UIViewController
    var covidRouter: String = ""
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension CovidRegionRouter: CovidRegionRouterProtocol {
    func presenterToRouterRegionSelection(presenterToRouterRegionSelectionData: String) {
       // navigationItem.title = presenterToRouterRegionSelectionData
        let covidData = CovidDataBuilder.build(regionBuilderData: presenterToRouterRegionSelectionData)
        self.covidRouter = presenterToRouterRegionSelectionData
        let barBtn = UIBarButtonItem()
        barBtn.title = ""
        self.viewController.navigationItem.backBarButtonItem = barBtn
        self.viewController.navigationController?.pushViewController(covidData, animated: true)
    }
}

