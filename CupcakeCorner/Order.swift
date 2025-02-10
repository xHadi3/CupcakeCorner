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
    
    var name = ""
    var streetAdress = ""
    var city = "" 
    var zip = ""
    
    var hasValidAddress:Bool{
        if name.isEmpty || streetAdress.isEmpty || city.isEmpty || zip.isEmpty{
            return false
        }
        return true
    }
    
    var cost:Decimal{
        //$2 per cake
        var cost = Decimal(quantity) * 2
        
        //complicated cake cost more
        cost += Decimal(type) / 2
        
        //$1 cake for extra frosting
        cost += Decimal(quantity)
        
        //$0.5 cake for sprinkles
        
        if addSprinkes{
            cost += Decimal(quantity) / 2
        }
        return cost
        
    }
}
