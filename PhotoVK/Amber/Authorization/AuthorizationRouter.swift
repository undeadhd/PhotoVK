//
//  Authorization
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import Foundation
import Amber

enum AuthorizationTransition: AmberTransition{
    case showFriends
}

class AuthorizationRouter: AmberRouter{
     func perform(transition: AuthorizationTransition, route: AmberRoutePerformer, reducer: AuthorizationReducer, performAction: @escaping (AuthorizationAction) -> Void){
        switch transition {
        case .showFriends:
            route.baseReplace(storyboardFile: "FriendsList", storyboardID: "MainNavigationController")
        }
    }
}
