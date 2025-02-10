//
//  Order.swift
//  CupcakeCorner
//
//  Created by Hadi Al zayer on 11/08/1446 AH.
//

import Foundation

@Observable
class Order{
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet{
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkes = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkes = false
    
}
