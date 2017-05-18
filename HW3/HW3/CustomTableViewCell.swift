//
//  CustomTableViewCell.swift
//  HW3
//
//  Created by lisa on 2017/5/18.
//  Copyright © 2017年 lisa. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var Title: UILabel!
    @IBOutlet weak var cityCode: UILabel!
    @IBOutlet weak var City: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
