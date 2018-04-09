//
//  StringExtensions.swift
//  PhotoVK
//
//  Created by Pavel Grechikhin on 07.04.2018.
//  Copyright © 2018 Pavel Grechikhin. All rights reserved.
//

import Foundation
import UIKit

extension String {
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}

var imageCache = NSMutableDictionary()

extension UIImageView {
    
    func loadAndCachedImage(url: String) {
        self.image = nil
        
        if let img = imageCache.value(forKey: url) as? UIImage {
            DispatchQueue.main.async {
                self.image = img
            }
        } else {
            if !url.isEmpty {
                let data = try? Data(contentsOf: URL(string: url)!)
                self.image = UIImage(data: data!)
                imageCache.setValue(self.image, forKey: url)
            }
        }
    }
}
