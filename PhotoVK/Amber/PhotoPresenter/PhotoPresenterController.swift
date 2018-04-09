//
//  PhotoPresenter
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

let PhotoPresenterModule = PhotoPresenterController.self

final class PhotoPresenterController: UIViewController, AmberController {

    let store = AmberStore(reducer: PhotoPresenterReducer(), router: PhotoPresenterRouter())

    static let storyboardFile = "PhotoPresenterBase"
    static let storyboardID = "PhotoPresenterController"

    //MARK: - IBOutlets
    @IBOutlet var closeGesture: UIPanGestureRecognizer!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var image: UIImageView!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    //MARK: - IBActions

}

//MARK: - Bindings
extension PhotoPresenterController{
    func bind(){
        
        let swipeBack = view.reactive.addGestureRecognizer(closeGesture)

        swipeBack.replace(with: .close).bind(to: transition)
        
        state.map { $0.url }.bind(to: image.reactive.loadAndCachedImage)
        closeButton.reactive.tap.replace(with: .close).bind(to: transition)
        
    }
    
}

//MARK: - UI
extension PhotoPresenterController{
}

//MARK: - Helpers
extension PhotoPresenterController{

}

