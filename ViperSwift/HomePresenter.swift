//
//  HomePresenter.swift
//  ViperSwift
//
//  Created by AHMET HAKAN YILDIRIM on 6.08.2023.
//

import Foundation

class HomePresenter: HomeViewPresenterInput {
    
    
    
    let interactor: HomeInteractor
    let view: HomeViewInputs
    
    init(interactor: HomeInteractor, view: HomeViewInputs) {
        self.interactor = interactor
        self.view = view
    }
    
    
   private func fetchCats() {
        // 1 2 3
       interactor.fetchCats(url: "\(Constant.BASE_URL)\(ServicePath.http.rawValue)") { response in
            switch response {
            case .success(let items):
                self.view.reloadTableView(cats: items)
                
            case .failure(let error):
                print(error)
            }
           self.view.indicatorView(animate: false)
        }
    }

    func onTapCell(model:Cat) {
        
    }

    func viewDidLoad() {
        view.indicatorView(animate: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.fetchCats()
        }
    }

    
}
