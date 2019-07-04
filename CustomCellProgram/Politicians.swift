//
//  Politicians.swift
//  CustomCellProgram
//
//  Created by Alivelu Ravula on 4/5/18.
//  Copyright © 2018 Alivelu Ravula. All rights reserved.
//

import UIKit

class Politicians: UITableViewCell {

    @IBOutlet weak var leaderName: UILabel!
    @IBOutlet weak var StateName: UILabel!
    @IBOutlet weak var partyName: UILabel!
    @IBOutlet weak var leaders: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
