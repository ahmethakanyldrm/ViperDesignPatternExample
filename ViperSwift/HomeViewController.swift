//
//  HomeViewController.swift
//  ViperSwift
//
//  Created by AHMET HAKAN YILDIRIM on 6.08.2023.
//

import SnapKit
import UIKit

final class HomeViewController: UIViewController {
    private let activityIndicator: UIActivityIndicatorView = .init()
    private let titleLabel: UILabel = .init()
    private let homeTableViewController: UITableView = .init()
    private var itemCats: [Cat] = []

    lazy var presenter: HomePresenter = {
        .init(interactor: HomeInteractor(), view: self)
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(homeTableViewController)
        view.addSubview(activityIndicator)
        makeUICordinate()
        presenter.viewDidLoad()
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCats.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Cats \(itemCats[indexPath.row].description)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onTapCell(model: itemCats[indexPath.row])
    }
}

extension HomeViewController: HomeViewInputs {
    func configure() {
        
    }

    func reloadTableView(cats: [Cat]) {
        itemCats = cats
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            homeTableViewController.reloadData()
        }
    }

    func setupTableViewCell() {
        
    }

    func indicatorView(animate: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {
                return
            }
             animate ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = !animate
        
        }
    }

    func sortByTitle() {
        
    }
}

// MARK: - UI Draw

extension HomeViewController {
    func makeUICordinate() {
        titleLabel.text = "Http Cat"
        titleLabel.textAlignment = .center
        activityIndicator.isHidden = false
        
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
            make.centerY.equalTo(self.view.safeAreaLayoutGuide.snp.centerY)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top).offset(10)
            make.centerX.equalTo(self.view.safeAreaLayoutGuide.snp.centerX)
        }

        homeTableViewController.snp.makeConstraints { make in
            make.top.equalTo(titleLabel).offset(20)
            make.left.equalTo(self.view).offset(20)
            make.right.equalTo(self.view).offset(-20)
            make.horizontalEdges.equalTo(titleLabel)
            make.bottom.equalTo(self.view)
        }

        homeTableViewController.dataSource = self
        homeTableViewController.delegate = self
    }
}
