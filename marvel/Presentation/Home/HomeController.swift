//
//  HomeController.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import UIKit
import PKHUD

class HomeController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    private let presenter = HomePresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.onViewDidLoad(delegate: self)
        self.navigationItem.title = "MARVEL HEROES"
    }
    
    private func registerCell(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "HomeCell", bundle: nil), forCellReuseIdentifier: Constants.cells.homeCell)
    }
    
    private func navigateToDetail(id: String){
        let vcDetail : DetailController = UIStoryboard.mainStoryboard().instantiateViewController(withIdentifier: Constants.controllers.detail) as! DetailController
        vcDetail.id = id
        self.navigationController?.pushViewController(vcDetail, animated: true)
    }
}

extension HomeController: HomeViewDelegate{
    func setupView() {
        self.registerCell()
    }
    
    func success() {
        self.tableView.reloadSections(IndexSet.init(integer: 0), with: .fade)
        self.hideLoading()
    }
    
    func failure(error: String) {
        HUD.show(.labeledError(title: error, subtitle: nil), onView: self.view)
    }
    
    func showLoading() {
        HUD.show(.progress, onView: self.tableView)
    }
    
    func hideLoading() {
        HUD.hide(animated: true, completion: nil)
    }
}

extension HomeController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height/3
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.bounds.height/3
    }
}

extension HomeController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell : HomeCell = tableView.dequeueReusableCell(withIdentifier: Constants.cells.homeCell, for: indexPath) as? HomeCell{
            cell.urlImage = self.presenter.dataSource[indexPath.row].picture
            cell.data = self.presenter.dataSource[indexPath.row].name
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (self.presenter.dataSource.count - 1) == indexPath.row{
            self.presenter.canCallNextPage()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hero = self.presenter.dataSource[indexPath.row]
        self.navigateToDetail(id: hero.id.description)
    }
}
