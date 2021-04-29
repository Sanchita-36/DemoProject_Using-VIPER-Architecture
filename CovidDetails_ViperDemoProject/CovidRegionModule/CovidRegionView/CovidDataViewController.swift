//
//  CovidDataViewController.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

protocol CovidDataViewProtocol: class {
    func updateRegionData(regionDataList: [RegionDataVM]) -> ()
    func fetchViewString(viewString: String)
}

class CovidDataViewController: UIViewController {
    
    var presenterData: CovidDataPresenterProtocol!
    var arrayOfRegionData = [RegionDataVM]()
    var saveViewString: String = ""
    
    @IBOutlet weak var totalInfectedLabel: UILabel!
    @IBOutlet weak var newInfectedLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var newRecoveredLabel: UILabel!
    @IBOutlet weak var deceasedLabel: UILabel!
    @IBOutlet weak var newDeceasedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenterData.viewDidLoadData()
        // Do any additional setup after loading the view.
    }
}

extension CovidDataViewController: CovidDataViewProtocol {
    func updateRegionData(regionDataList: [RegionDataVM]) {
        arrayOfRegionData = regionDataList
        print("Region Data List: \(regionDataList)")
        for item in 0..<arrayOfRegionData.count{
            let itemRegion =  arrayOfRegionData[item].region
            let saveResultRegion = self.saveViewString
            
            if itemRegion == saveViewString {
                totalInfectedLabel.text = String(arrayOfRegionData[item].totalInfected)
                newInfectedLabel.text = String(arrayOfRegionData[item].newInfected)
                recoveredLabel.text = String(arrayOfRegionData[item].recovered)
                newRecoveredLabel.text = String(arrayOfRegionData[item].newRecovered)
                deceasedLabel.text = String(arrayOfRegionData[item].deceased)
                newDeceasedLabel.text = String(arrayOfRegionData[item].newDeceased)
            }
        }
    }
    
    func fetchViewString(viewString: String) {
        self.saveViewString = viewString
        print(saveViewString)
     }
     
    
}

