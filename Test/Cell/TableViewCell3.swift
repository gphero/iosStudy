//
//  TableViewCell3.swift
//  Test
//
//  Created by GiUng Jang on 2022/07/27.
//

import UIKit

class TableViewCell3: UITableViewCell {
    
    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    @IBOutlet weak var LabelThree: UILabel!
    
    func setLabel3Text (apiResponse:ApiResponse) { // ? =String이 nil일 수있다.
        self.LabelOne.text = apiResponse.curNm
        self.LabelTwo.text = apiResponse.curUnit
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
