//
//  CovidDataRouter.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 29/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

protocol CovidDataRouterProtocol {
    func fetchViewString() -> String
}

class CovidDataRouter {
    var viewControllerData: UIViewController
    var viewString: String
    
    init(viewCD: UIViewController, viewString: String ) {
        self.viewControllerData = viewCD
        self.viewString = viewString
    }
}

extension CovidDataRouter: CovidDataRouterProtocol {
    func fetchViewString() -> String {
       return self.viewString
    }
}
