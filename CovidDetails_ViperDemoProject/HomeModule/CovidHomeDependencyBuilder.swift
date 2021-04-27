//
//  CovidHomeDependencyBuilder.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

class CovidHomeDependencyBuilder {
    
    static func builder() -> UIViewController {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(identifier: "CovidHomeViewController") as! CovidHomeViewController
        let interactor = CovidHomeInteractor()
        let router = CovidHomeRouter(view: view)
        let presenter = CovidHomePresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        return view
    }
}
