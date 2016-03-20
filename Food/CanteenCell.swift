//
//  CanteenCell.swift
//  Food
//
//  Created by Samuelhuang on 19/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit

class CanteenCell: UITableViewCell {


    @IBOutlet weak var canteenImage: UIImageView!
    @IBOutlet weak var canteenName: UILabel!
    @IBOutlet weak var canteenAdr: UILabel!
    @IBOutlet weak var canteenTag: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
