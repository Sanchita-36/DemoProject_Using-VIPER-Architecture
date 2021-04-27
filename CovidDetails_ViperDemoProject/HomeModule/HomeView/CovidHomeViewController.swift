//
//  ViewController.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

protocol CovidHomeViewProtocol: class {
    func updateData(cityArray: [CovidHomeModel]) -> Void
}

class CovidHomeViewController: UIViewController {
    
    @IBOutlet weak var cityTableView: UITableView!
    
    var presenter: CovidHomePresenterProtocol!
    var arrayOfCities = [CovidHomeModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter.viewDidLoad()
        self.cityTableView.rowHeight = 60;
    }
}

extension CovidHomeViewController: CovidHomeViewProtocol {
    func updateData(cityArray: [CovidHomeModel]) {
        arrayOfCities = cityArray
        print("VIEW: city array \(arrayOfCities.count)")
        cityTableView.reloadData()
    }
}

extension CovidHomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      if let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell") as? CovidCityTableViewCell {
        let cities = arrayOfCities[indexPath.row]
        cell.updateViews(city: cities)
        return cell
      }else {
        return CovidCityTableViewCell()
        }
       
    }
}

