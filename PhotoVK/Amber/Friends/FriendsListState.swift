//
//  State.swift
//  TemplatesiOS
//
//  Created by Nikita Arkhipov on 24/03/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import Foundation
import Amber

struct FriendsListState: AmberState {
    var description: String { return "" }
    
    var allItems: [GetFriendsModel] = []
    
    init(data: Void) {}
}
