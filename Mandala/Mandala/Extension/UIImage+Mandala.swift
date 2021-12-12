//
//  UIImage+Mandala.swift
//  Mandala
//
//  Created by Atheer abdullah on 05/05/1443 AH.
//

import UIKit


enum ImageResource: String {
  case angry
  case confused
  case crting
  case goofy
  case happy
  case meh
  case sad
  case sleepy
}


extension UIImage {
  
  convenience init(resource: ImageResource) {
         self.init(named: resource.rawValue)!
     }
}

