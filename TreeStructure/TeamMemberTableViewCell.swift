//
//  TeamMemberTableViewCell.swift
//  TreeStructure
//
//  Created by Varun Wadhwa on 30/08/17.
//  Copyright © 2017 Varun Wadhwa. All rights reserved.
//

import UIKit

class TeamMemberTableViewCell: UITableViewCell {
    
    @IBOutlet var plus : UILabel!
    @IBOutlet var name : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
