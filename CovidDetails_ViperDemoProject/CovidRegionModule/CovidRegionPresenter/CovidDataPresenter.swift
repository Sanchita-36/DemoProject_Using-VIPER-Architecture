//
//  CovidDataPresenter.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 28/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//

import UIKit

protocol CovidDataPresenterProtocol {
    func viewDidLoadData() -> Void
    
}

class CovidDataPresenter {
    weak var viewData: CovidDataViewProtocol?
    var interactorData: CovidDataInteractorProtocol
    var routerData: CovidDataRouterProtocol
    
    var region: String = ""
    
    init(viewData: CovidDataViewProtocol,interactorData: CovidDataInteractorProtocol, routerData: CovidDataRouterProtocol) {
        self.viewData = viewData
        self.interactorData = interactorData
        self.routerData = routerData
    }
}

extension CovidDataPresenter: CovidDataPresenterProtocol {
    
    func viewDidLoadData() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactorData.getCovidData(completion: { (result) in
                let saveDataResult = result.regionData.compactMap({RegionDataVM(using: $0)})
                DispatchQueue.main.async {
                    let viewStringResult = self?.routerData.fetchViewString()
                    self?.viewData?.fetchViewString(viewString: viewStringResult!)
                    self?.viewData?.updateRegionData(regionDataList: saveDataResult)
                }
            })
        }
    }
    
}

struct RegionDataVM {
    let region: String
    let totalInfected: Int
    let newInfected: Int
    let recovered: Int
    let newRecovered: Int
    let deceased: Int
    let newDeceased: Int
    
    init(using regionDataList: CovidData) {
        self.region = regionDataList.region
        self.totalInfected = regionDataList.totalInfected
        self.newInfected = regionDataList.newInfected
        self.recovered = regionDataList.recovered
        self.newRecovered = regionDataList.newRecovered
        self.deceased = regionDataList.deceased
        self.newDeceased = regionDataList.newDeceased
    }
}




