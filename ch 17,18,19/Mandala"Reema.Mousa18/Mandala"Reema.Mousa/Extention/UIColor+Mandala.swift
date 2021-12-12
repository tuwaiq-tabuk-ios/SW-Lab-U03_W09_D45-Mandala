//
//  UIColor+Mandala.swift
//  Mandala"Reema.Mousa
//
//  Created by Reema Mousa on 07/05/1443 AH.
//

import UIKit

extension UIColor {
  static let angry = UIColor(named: "angryRed")!
  static let confused = UIColor(named: "confusedPurple")!
  static let crying = UIColor(named: "cryingLightBlue")!
  static let goofy = UIColor(named: "goofyOrange")!
  static let happy = UIColor(named: "happyTurquoise")!
  static let meh = UIColor(named: "mehGray")!
  static let sad = UIColor(named: "sadBlue")!
  static let sleepy = UIColor(named: "sleepyLightRed")!
}
extension UIImage {
    enum ImageResource : String{
    case angry
    case confused
    case crying
    case goofy
    case happy
    case meh
    case sad
    case sleepy
  }
convenience init(resource: ImageResource) {
      self.init(named: resource.rawValue)!
    }
    
  }
  
