//
//  HomeContractor.swift
//  ViperSwift
//
//  Created by AHMET HAKAN YILDIRIM on 6.08.2023.
//

import Foundation

protocol HomeInteractorOutputs {
    func onSuccessSearch()
    func onErrorSearch()
}

protocol HomeViewInputs {
    func configure()
    func reloadTableView(cats: [Cat])
    func setupTableViewCell()
    func indicatorView(animate: Bool)
    func sortByTitle()
}

protocol HomeViewPresenterInput {
    func viewDidLoad()
    func onTapCell(model:Cat)
    
}
