//
//  Canteen.swift
//  Food
//
//  Created by Samuelhuang on 19/3/2016.
//  Copyright © 2016年 Samuelhuang. All rights reserved.
//

import UIKit
import Foundation

struct Canteen1{
    var name:String
    var type:String
    var location:String
    var image:String
    var isVisited:Bool
    var rating = ""
    
    init(name: String, type: String, location: String, image: String, isVisited: Bool){
    
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.isVisited = isVisited
    }
}


