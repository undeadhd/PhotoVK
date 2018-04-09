//
//  Router.swift
//  TemplatesiOS
//
//  Created by Nikita Arkhipov on 24/03/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import Foundation
import Amber

enum FriendsListTransition: AmberTransition{
    case showFriendPhotos(Int)
}

class FriendsListRouter: AmberRouter{
     func perform(transition: FriendsListTransition, route: AmberRoutePerformer, reducer: FriendsListReducer, performAction: @escaping (FriendsListAction) -> Void){
        switch transition {
        case .showFriendPhotos(let id):
            _ = route.show(FriendPhotosCollectionModule, data: id)
        }
    }
}
