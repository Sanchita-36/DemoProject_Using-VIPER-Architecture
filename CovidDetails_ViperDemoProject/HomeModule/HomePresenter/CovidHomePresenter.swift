//
//  HomePresenter.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//
import UIKit

protocol CovidHomePresenterProtocol {
    func viewDidLoad() -> Void
}

class CovidHomePresenter {
    weak var view: CovidHomeViewProtocol?
    var interactor: CovidHomeInteractorProtocol
    var router: CovidHomeRouterProtocol
    
    var regionArray = [RegionResult]()
    
    init(view: CovidHomeViewProtocol,interactor: CovidHomeInteractorProtocol, router: CovidHomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CovidHomePresenter: CovidHomePresenterProtocol {
    
    func viewDidLoad() {
        /* Use this in case you consider CovidCityService.swift
         let covidCityPresenter = self.interactor.getCity()
         print("CovidCities\(covidCityPresenter)")
         DispatchQueue.main.async { [weak self] in
         guard let `self` = self else {return}
         self.view?.updateData(cityArray: covidCityPresenter) */
        
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.interactor.getRegionData (completion: { (result) in
                let saveResult = result.regionData.compactMap({RegionDataViewModel(using: $0)})
                DispatchQueue.main.async {
                    self?.view?.updateRegion(regionList: saveResult)
                }
            })
        }
    }
    
}

// Do not Use in case you consider CovidCityService.swift
struct RegionDataViewModel {
    let regionData: String
    
    init(using regionDataList: Region) {
        self.regionData = regionDataList.region
    }
}


