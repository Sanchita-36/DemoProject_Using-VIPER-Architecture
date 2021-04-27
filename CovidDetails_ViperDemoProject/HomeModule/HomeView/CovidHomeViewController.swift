//
//  ViewController.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

protocol CovidHomeViewProtocol: class {
    // func updateData(cityArray: [CovidHomeModel]) -> Void     - Use this in case you consider CovidCityService.swift
    func updateRegion(regionList: [RegionDataViewModel]) -> ()
}

class CovidHomeViewController: UIViewController {
    
    @IBOutlet weak var stateTableView: UITableView!
    /*Use this in case you consider CovidCityService.swift
     @IBOutlet weak var cityTableView: UITableView! */
    
    var presenter: CovidHomePresenterProtocol!
    var arrayOfRegion = [RegionDataViewModel]()
    //var arrayOfCities = [CovidHomeModel]() - Use this in case you consider CovidCityService.swift
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        // self.stateTableView.rowHeight = 60  - Use this if you dont add heightForRowAt function
    }
}

extension CovidHomeViewController: CovidHomeViewProtocol {
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

extension CovidHomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfRegion.count
        // return arrayOfCities.count - Use this in case you consider CovidCityService.swift
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "stateCell") as? CovidCityTableViewCell {
            let regionList = arrayOfRegion[indexPath.row]
            print("RegionListArray: \(regionList)")
            cell.updateRegions(region: regionList)
            return cell
            /* Use this in case you consider CovidCityService.swift
             let cities = arrayOfCities[indexPath.row]
             cell.updateViews(city: cities)
             return cell */
        }else {
            return CovidCityTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

