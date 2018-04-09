//
//  Reducer.swift
//  TemplatesiOS
//
//  Created by Nikita Arkhipov on 24/03/2018.
//  Copyright © 2018 Anvics. All rights reserved.
//

import Foundation
import Amber



enum FriendsListAction: AmberAction{
    case loadUserList(GetFriendsInteractor)
}

extension FriendsListAction: FailableInteractionable {
    var performer: FailablePerformer? {
        switch self {
        case .loadUserList(let i):
            return ServerInteraction(interactor: i)
        }
    }
}


class FriendsListReducer: AmberReducer{
    
    func initialize(state: FriendsListState, performAction: @escaping (FriendsListAction) -> Void, performOutputAction: @escaping (FriendsListOutputAction) -> Void){
    }
    
    func reduce(action: FriendsListAction, state: FriendsListState, performTransition: @escaping (FriendsListTransition) -> Void, performAction: @escaping (FriendsListAction) -> Void, performOutputAction: @escaping (FriendsListOutputAction) -> Void) -> FriendsListState{
        var newState = state
        switch action {
        case .loadUserList(let interactor):
            newState.allItems = interactor.respons
        }
        return newState
    }
    
    func reduceInput(action: FriendsListInputAction, state: FriendsListState, performAction: @escaping (FriendsListAction) -> Void, performOutputAction: @escaping (FriendsListOutputAction) -> Void) -> FriendsListState{
        var newState = state
//        switch action {
//        }
        return newState
    }
}


