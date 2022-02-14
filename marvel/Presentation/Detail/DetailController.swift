//
//  DetailController.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import Foundation
import UIKit
import PKHUD

class DetailController: UIViewController{
    
    @IBOutlet weak var imageBackground: UIImageView!
    @IBOutlet weak var lbName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let presenter = DetailPresenter()
    
    var id : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.onViewDidLoad(delegate: self, id: self.id)
    }
    
    private func registerCell(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UINib.init(nibName: "DetailCell", bundle: nil), forCellReuseIdentifier: Constants.cells.DetailCell)
    }
}

extension DetailController: DetailViewDelegate{
    func setupView() {
        self.registerCell()
    }
    
    func success() {
        self.tableView.reloadData()
    }
    
    func failure(error: String) {
        HUD.show(.labeledError(title: error, subtitle: nil), onView: self.view)
    }
    
    func showData(name: String, image: UIImage) {
        self.lbName.text = name
        self.imageBackground.image = image
    }
}

extension DetailController: UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return self.presenter.getNumberOfComics()
        case 1:
            return self.presenter.getNumberOfSeries()
        case 2:
            return self.presenter.getNumberOfEvents()
        case 3:
            return self.presenter.getNumberOfStories()
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension DetailController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell : DetailCell = tableView.dequeueReusableCell(withIdentifier: Constants.cells.DetailCell, for: indexPath) as? DetailCell{
            return self.prepareCell(indexPath: indexPath, cell: cell)
        }
        
        return UITableViewCell()
    }
    
    func prepareCell(indexPath: IndexPath, cell: DetailCell) -> UITableViewCell{
        var item : ItemEntity
        switch indexPath.section{
        case 0:
            item = self.presenter.getComics()[indexPath.row]
        case 1:
            item = self.presenter.getSeries()[indexPath.row]
        case 2:
            item = self.presenter.getEvents()[indexPath.row]
        case 3:
            item = self.presenter.getStories()[indexPath.row]
        default:
            return cell
        }
        cell.data = item
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.presenter.getNameSection(section: section)
    }
}
