//
//  PhotoPresenter
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import Foundation
import Amber

enum PhotoPresenterTransition: AmberTransition{
    case close
}

class PhotoPresenterRouter: AmberRouter{
     func perform(transition: PhotoPresenterTransition, route: AmberRoutePerformer, reducer: PhotoPresenterReducer, performAction: @escaping (PhotoPresenterAction) -> Void){
        switch transition {
        case .close:
            route.close()
        }
    }
}
