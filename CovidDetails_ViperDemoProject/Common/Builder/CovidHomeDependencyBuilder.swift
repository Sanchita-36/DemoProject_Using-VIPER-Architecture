//
//  CovidHomeDependencyBuilder.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

class CovidRegionDependencyBuilder {
    
    static func builder(usingNavigationFactory factory: NavigationFactory) -> UINavigationController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "CovidRegionDataViewController") as! CovidRegionDataViewController
        let interactor = CovidRegionInteractor(service: CovidDataAPI.shared)
        let router = CovidRegionRouter(view: view)
        let presenter = CovidRegionPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return factory(view)
    }
}
