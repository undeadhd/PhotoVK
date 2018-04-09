//
//  Cell.swift
//  TemplatesiOS
//
//  Created by Nikita Arkhipov on 24/03/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import UIKit
import Bond

class FriendsListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarView: UIImageView!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
