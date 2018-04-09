//
//  PhotoPresenter
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import Foundation
import Amber

enum PhotoPresenterAction: AmberAction{
}

class PhotoPresenterReducer: AmberReducer{
    
    func initialize(state: PhotoPresenterState, performAction: @escaping (PhotoPresenterAction) -> Void, performOutputAction: @escaping (PhotoPresenterOutputAction) -> Void){
        
    }
    
    func reduce(action: PhotoPresenterAction, state: PhotoPresenterState, performTransition: @escaping (PhotoPresenterTransition) -> Void, performAction: @escaping (PhotoPresenterAction) -> Void, performOutputAction: @escaping (PhotoPresenterOutputAction) -> Void) -> PhotoPresenterState{
        var newState = state
//        switch action {
//
//        }
        return newState
    }
    
    func reduceInput(action: PhotoPresenterInputAction, state: PhotoPresenterState, performAction: @escaping (PhotoPresenterAction) -> Void, performOutputAction: @escaping (PhotoPresenterOutputAction) -> Void) -> PhotoPresenterState{
        var newState = state
//        switch action {
//        case <#pattern#>: <#code#>
//        }
        return newState
    }
}
