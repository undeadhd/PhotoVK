//
//  FailableInteractionMiddleware.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import Amber
import Magics


protocol FailablePerformer {
    func perform(completion: @escaping (ResponseError?) -> Void)
}

struct ServerInteraction<I: MagicsInteractor>: FailablePerformer{
    let api: MagicsAPI
    let interactor: I
    
    init(api: MagicsAPI = VKApi.shared, interactor: I) {
        self.api = api
        self.interactor = interactor
    }
    
    func perform(completion: @escaping (ResponseError?) -> Void) {
        api.interact(interactor) { _, error in
            completion(error as? ResponseError)
        }
    }
}


protocol FailableInteractionable {
    var performer: FailablePerformer? { get }
    var shouldRedirectOnAuthScreenForAuthProblems: Bool { get }
}

extension FailableInteractionable{
    var shouldRedirectOnAuthScreenForAuthProblems: Bool { return true }
}

class FailableInteractionMiddleware: AmberMiddleware{
    func perform(event: Any, onState state: Any, route: AmberRoutePerformer, performBlock: @escaping () -> ()){
        guard let ievent = (event as? FailableInteractionable),
            let performer = ievent.performer else {
                performBlock()
                return
        }
        
        performer.perform { error in
            if let error = error {
                if error.isInvalidToken && ievent.shouldRedirectOnAuthScreenForAuthProblems { route.replace(with: AuthorizationModule) }
//                else if ievent.shouldShowError { _ = route.present(AlertModule, data: ("Ошибка!", error.message)) }
            } else { performBlock() }
        }
    }
}
