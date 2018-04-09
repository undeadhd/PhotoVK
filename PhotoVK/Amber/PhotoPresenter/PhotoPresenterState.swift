//
//  PhotoPresenter
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import Foundation
import Amber

struct PhotoPresenterState: AmberState {

    var description: String { return "" }
    
    var url = ""
    
    

    init(data: String) {
        url = data
    }
}
