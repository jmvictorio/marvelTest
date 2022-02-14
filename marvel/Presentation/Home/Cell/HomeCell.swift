//
//  HomeCell.swift
//  marvel
//
//  Created by jvictorio on 13/2/22.
//

import UIKit
import Alamofire

class HomeCell: UITableViewCell {
    
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var imageBackground: UIImageView!
    
    var data: String = ""{
        didSet{
            self.setupData()
        }
    }
    
    var urlImage: String?{
        didSet{
            self.loadImage()
        }
    }
    
    private func setupData(){
        self.lbTitle.text = self.data
    }
    
    private func loadImage(){
        AF.request(self.urlImage ?? "").responseData { (response) in
            if response.error == nil {
                if let data = response.data {
                    self.imageBackground.image = UIImage(data: data)
                }
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
