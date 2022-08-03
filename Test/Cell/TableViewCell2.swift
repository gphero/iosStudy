//
//  TableViewCell2.swift
//  Test
//
//  Created by GiUng Jang on 2022/07/27.
//

import UIKit

class TableViewCell2: UITableViewCell {

    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    @IBOutlet weak var LabelThree: UILabel!
    
    func setLabel2Text (dic:[String:String]) {
        self.LabelOne.text = dic["value"]
        self.LabelTwo.text = dic["value"]
        self.LabelThree.text = dic["value"]
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
