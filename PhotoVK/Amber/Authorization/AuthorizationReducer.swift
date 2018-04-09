//
//  Authorization
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import Foundation
import Amber

enum AuthorizationAction: AmberAction{
}

class AuthorizationReducer: AmberReducer{
    
    func initialize(state: AuthorizationState, performAction: @escaping (AuthorizationAction) -> Void, performOutputAction: @escaping (AuthorizationOutputAction) -> Void){
        
    }
    
    func reduce(action: AuthorizationAction, state: AuthorizationState, performTransition: @escaping (AuthorizationTransition) -> Void, performAction: @escaping (AuthorizationAction) -> Void, performOutputAction: @escaping (AuthorizationOutputAction) -> Void) -> AuthorizationState{
        var newState = state
//        switch action {
//
//        }
        return newState
    }
    
    func reduceInput(action: AuthorizationInputAction, state: AuthorizationState, performAction: @escaping (AuthorizationAction) -> Void, performOutputAction: @escaping (AuthorizationOutputAction) -> Void) -> AuthorizationState{
        var newState = state
//        switch action {
//        case <#pattern#>: <#code#>
//        }
        return newState
    }
}
