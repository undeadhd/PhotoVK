//
//  Authorization
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import Foundation
import Amber

struct AuthorizationState: AmberState {

    var description: String { return "" }
    
    var url: URL = URL(string: "https://oauth.vk.com/authorize?client_id=6439743&display=page&redirect_uri=https://oauth.vk.com/blank.html&scope=friends,photos&response_type=token&v=5.52")!
    
    init(data: Void) { }
}
