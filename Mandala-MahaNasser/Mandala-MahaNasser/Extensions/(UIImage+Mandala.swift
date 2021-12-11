//
//  (UIImage+Mandala.swift
//  Mandala-MahaNasser
//
//  Created by Maha S on 11/12/2021.
//

import UIKit

enum ImageResource: String {
  case angry
  case confused
  case crying
  case goofy
  case happy
  case meh
  case sad
  case sleepy }


extension UIImage {
  convenience init(resource: ImageResource) {
    self.init(named: resource.rawValue)!
  }

}

