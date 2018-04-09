//
//  Authorization
//  
//
//  Created by  on .
//  Copyright ©  . All rights reserved.
//

import UIKit
import Bond
import Amber
//import Animatics
//import AnimaticsBond

let AuthorizationModule = AuthorizationController.self

final class AuthorizationController: UIViewController, AmberController {

    let store = AmberStore(reducer: AuthorizationReducer(), router: AuthorizationRouter())

    static let storyboardFile = "AuthorizationBase"
    static let storyboardID = "AuthorizationController"

    //MARK: - IBOutlets
    @IBOutlet weak var webView: UIWebView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        //initialize()//раскоментируйте, если на этот экран можно попасть не через Amber transition или Amber.setInitial переход
        bind()
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension AuthorizationController{
    func bind(){
        state.map { $0.url }.bind(to: webView.reactive.loadRequest)
    }
}

//MARK: - UI
extension AuthorizationController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        if (request.url?.absoluteString.contains("access_token"))! {
            
            if let token = request.url!.absoluteString.slice(from: "access_token=", to: "&") {
                VKApi.shared.tokenVK = token
                perform(transitions: .showFriends)
            }
            
        }
        return true
    }
    
    
}


//MARK: - Helpers
extension AuthorizationController{
    
}

