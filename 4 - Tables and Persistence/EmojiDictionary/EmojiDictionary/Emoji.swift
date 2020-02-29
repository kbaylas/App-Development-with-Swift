//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Kaan Baylas on 28.02.2020.
//  Copyright © 2020 Kaan Baylas. All rights reserved.
//

import Foundation
import UIKit

struct Emoji
{
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    init(symbol: String, name: String, description: String, usage: String)
    {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.usage = usage
    }
}
