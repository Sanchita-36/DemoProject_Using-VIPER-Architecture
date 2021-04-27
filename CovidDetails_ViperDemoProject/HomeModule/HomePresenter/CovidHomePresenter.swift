//
//  HomePresenter.swift
//  CovidDetails_ViperDemoProject
//
//  Created by Mac on 26/04/21.
//  Copyright © 2021 Sanchita. All rights reserved.
//
import Foundation

protocol CovidHomePresenterProtocol {
    func viewDidLoad() -> Void
}

class CovidHomePresenter {
    weak var view: CovidHomeViewProtocol?
    var interactor: CovidHomeInteractorProtocol
    var router: CovidHomeRouterProtocol
    
    init(view: CovidHomeViewProtocol,interactor: CovidHomeInteractorProtocol, router: CovidHomeRouterProtocol) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension CovidHomePresenter: CovidHomePresenterProtocol {
    func viewDidLoad() {
        let covidCityPresenter = self.interactor.getCity()
        print("CovidCities\(covidCityPresenter)")
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else {return}
            self.view?.updateData(cityArray: covidCityPresenter)
        }
    }
}
