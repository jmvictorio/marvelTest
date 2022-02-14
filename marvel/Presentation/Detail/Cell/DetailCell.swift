//
//  DetailCell.swift
//  marvel
//
//  Created by jvictorio on 14/2/22.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var lbItem: UILabel!
    
    var data: ItemEntity?{
        didSet{
            self.setupData()
        }
    }
    
    private func setupData(){
        self.lbItem.text = self.data?.name
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
