//
//  TableViewCell.swift
//  Test
//
//  Created by GiUng Jang on 2022/07/12.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    
    
    func setLabel1Text (dic:[String:String]) {
        self.label1.text = dic["value"]
        self.label2.text = dic["value"]
        self.label3.text = dic["value"]
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
