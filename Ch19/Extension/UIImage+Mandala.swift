//
//  UIImage+Mandala.swift
//  Mandala
//
//  Created by Shorouq AlAnzi on 04/05/1443 AH.
//

import UIKit
extension UIImage {
    
    
    convenience init(resource: ImageResource) {
            self.init(named: resource.rawValue)!
        }
}


enum ImageResource: String {
    case angry
    case confused
    case crying
    case goofy
    case happy
    case meh
case sad
case sleepy
    
    
    
}
