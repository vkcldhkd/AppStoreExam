//
//  AppsTableViewCell.swift
//  AppStoreExam
//
//  Created by Sung Hyun on 2018. 6. 20..
//  Copyright © 2018년 Sung Hyun. All rights reserved.
//

import UIKit

class AppsTableViewCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.imgView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
