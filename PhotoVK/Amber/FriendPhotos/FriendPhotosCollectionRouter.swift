//
//  CollectionCollectionRouter.swift
//  Tetrapak
//
//  Created by mapmelad on 03/04/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import Foundation
import Amber

enum FriendPhotosCollectionTransition: AmberTransition{
    case showPhoto(String)
}

class FriendPhotosCollectionRouter: AmberRouter{
    func perform(transition: FriendPhotosCollectionTransition, route: AmberRoutePerformer, reducer: FriendPhotosCollectionReducer, performAction: @escaping (FriendPhotosCollectionAction) -> Void){
        switch transition {
        case .showPhoto(let url):
            _ = route.present(PhotoPresenterModule, data: url)
        }
    }
}
