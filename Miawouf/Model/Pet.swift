//
//  Pet.swift
//  Miawouf
//
//  Created by Frederick Port on 27/10/2019.
//  Copyright © 2019 Frederick Port. All rights reserved.
//

import Foundation

struct Pet {
  var name: String?
  var hasMajority: Bool
  var phone: String?
  var race: String?
  var gender: Gender
  
  enum Gender {
    case male, female
  }
  
}
