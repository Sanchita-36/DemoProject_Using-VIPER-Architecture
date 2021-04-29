//
//  ViewController.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

protocol CovidRegionViewProtocol: class {
    // func updateData(cityArray: [CovidHomeModel]) -> Void     - Use this in case you consider CovidCityService.swift
    func updateRegion(regionList: [RegionDataViewModel]) -> ()
    func RegionSelection(regionSelection: String) -> String
}

class CovidRegionDataViewController: UIViewController {
    
    @IBOutlet weak var stateTableView: UITableView!
    /*Use this in case you consider CovidCityService.swift
     @IBOutlet weak var cityTableView: UITableView! */
    
    var presenter: CovidRegionPresenterProtocol!
    
    var arrayOfRegion = [RegionDataViewModel]()
    //var arrayOfCities = [CovidHomeModel]() - Use this in case you consider CovidCityService.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        // self.stateTableView.rowHeight = 60  - Use this if you dont add heightForRowAt function
    }
}

extension CovidRegionDataViewController: CovidRegionViewProtocol {
    func RegionSelection(regionSelection: String) -> String {
        let regionSelectedOnTableViewCell = regionSelection
        return regionSelection
    }
    
    func updateRegion(regionList: [RegionDataViewModel]) {
        arrayOfRegion = regionList
        print("Region List: \(regionList)")
        stateTableView.reloadData()
    }
    /* Use this in case you consider CovidCityService.swift
     func updateData(cityArray: [CovidHomeModel]) {
     arrayOfCities = cityArray
     print("VIEW: city array \(arrayOfCities.count)")
     cityTableView.reloadData()
     }*/
}

extension CovidRegionDataViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRegion.count
        // return arrayOfCities.count - Use this in case you consider CovidCityService.swift
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell") as? CovidStateTableViewCell {
            let regionList = arrayOfRegion[indexPath.row]
            print("RegionListArray: \(regionList)")
            cell.updateRegions(region: regionList)
            return cell
            /* Use this in case you consider CovidCityService.swift
             let cities = arrayOfCities[indexPath.row]
             cell.updateViews(city: cities)
             return cell */
        }else {
            return CovidStateTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let region = arrayOfRegion[indexPath.row].regionData
        print("Didselect region label: \(region)")
        let viewToPresenterRegionSelectionData  = RegionSelection(regionSelection: region)
        presenter.presenterToRouterRegionSelection(presenterToRouterRegionSelectionData: viewToPresenterRegionSelectionData)
    }
}

