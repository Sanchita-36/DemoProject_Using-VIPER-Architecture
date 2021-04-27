//
//  CovidCityTableViewCell.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

class CovidCityTableViewCell: UITableViewCell {

  
    @IBOutlet weak var cityLabel: UILabel!
    
    func updateViews(city: CovidHomeModel) {
        cityLabel.text = city.cityTitle
        
    }
}
