//
//  NavigationBuilder.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

typealias NavigationFactory = (UIViewController) -> (UINavigationController)

class NavigationBuilder {
    
  static func build(rootVC: UIViewController) -> UINavigationController {
    let textStyle: [NSAttributedString.Key: Any] = [
        .foregroundColor : UIColor.white,
        .font : UIFont.init(name: "AvenirNext-DemiBold", size: 22.0)
    ]
    
    let largeTextStyle: [NSAttributedString.Key: Any] = [
           .foregroundColor : UIColor.white,
           .font : UIFont.init(name: "AvenirNext-DemiBold", size: 28.0)
       ]
    
    let navigationController = UINavigationController(rootViewController: rootVC)
    navigationController.navigationBar.barTintColor = UIColor.red
    navigationController.navigationBar.tintColor = UIColor.white
    navigationController.navigationBar.titleTextAttributes = textStyle
    navigationController.navigationBar.largeTitleTextAttributes = largeTextStyle
    navigationController.navigationBar.isTranslucent = false
    navigationController.navigationBar.prefersLargeTitles = false
    //let barBtn = UIBarButtonItem()
   // barBtn.title = "Back"
    //navigationController.navigationItem.backBarButtonItem = barBtn
    return navigationController
    }
    
}
