//
//  ReactiveExtension.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 06.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import Bond
import ReactiveKit
import UIKit

extension ReactiveExtensions where Base: UIWebView {
    public var loadRequest: Bond<URL> {
        return bond { $0.loadRequest(URLRequest(url: $1)) }
    }
}

extension ReactiveExtensions where Base: UIImageView {
    public var loadAndCachedImage: Bond<String> {
        return bond { $0.loadAndCachedImage(url: $1) }
    }
}
