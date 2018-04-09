//
//  CollectionCollectionReducer.swift
//  Tetrapak
//
//  Created by mapmelad on 03/04/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import Foundation
import Amber


enum FriendPhotosCollectionAction: AmberAction{
    case downloadPhoto(GetPhotosInteractor)
    case sendUrlToRoute(Int)
    case countPhoto(CountPhotoInteractor)
}

extension FriendPhotosCollectionAction: FailableInteractionable {
    var performer: FailablePerformer? {
        switch self {
        case .downloadPhoto(let i):
            return ServerInteraction(interactor: i)
        case .countPhoto(let i):
            return ServerInteraction(interactor: i)
        default:
            return nil
        }
    }
}

        
class FriendPhotosCollectionReducer: AmberReducer{
    
    func initialize(state: FriendPhotosCollectionState, performAction: @escaping (FriendPhotosCollectionAction) -> Void, performOutputAction: @escaping (FriendPhotosCollectionOutputAction) -> Void){
        
    }
    
    func reduce(action: FriendPhotosCollectionAction, state: FriendPhotosCollectionState, performTransition: @escaping (FriendPhotosCollectionTransition) -> Void, performAction: @escaping (FriendPhotosCollectionAction) -> Void, performOutputAction: @escaping (FriendPhotosCollectionOutputAction) -> Void) -> FriendPhotosCollectionState{
        var newState = state
        switch action {
        case .countPhoto(let interactor):
            performAction(.downloadPhoto(GetPhotosInteractor(id: state.userId, count: interactor.count)))
        case .downloadPhoto(let interactor):
            newState.photos = interactor.photos
        case .sendUrlToRoute(let index):
            performTransition(.showPhoto(state.photos[index].photo_604))
        }
        return newState
    }
    
    func reduceInput(action: FriendPhotosCollectionInputAction, state: FriendPhotosCollectionState, performAction: @escaping (FriendPhotosCollectionAction) -> Void, performOutputAction: @escaping (FriendPhotosCollectionOutputAction) -> Void) -> FriendPhotosCollectionState{
        var newState = state
//        switch action {
//        }
        return newState
    }
}
