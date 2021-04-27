//
//  HomeRouter.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//
import UIKit

protocol CovidHomeRouterProtocol: class {
}

class CovidHomeRouter {
    var viewController: UIViewController
    
    init(view: UIViewController) {
        self.viewController = view
    }
}

extension CovidHomeRouter: CovidHomeRouterProtocol {
    
}
