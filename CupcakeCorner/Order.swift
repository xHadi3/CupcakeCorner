//
//  Order.swift
//  CupcakeCorner
//
//  Created by Hadi Al zayer on 11/08/1446 AH.
//

import Foundation

@Observable
class Order: Codable{
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _city = "city"
        case _streetAddress = "streetAddress"
        case _zip = "zip"
    }
    
    
    static let types = ["Vanilla", "Strawberry", "Chocolate", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet{
            if specialRequestEnabled == false{
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress:Bool{
        if name.trimmingCharacters(in: .whitespaces).isEmpty || streetAddress.trimmingCharacters(in: .whitespaces).isEmpty || city.trimmingCharacters(in: .whitespaces).isEmpty || zip.trimmingCharacters(in: .whitespaces).isEmpty{
            
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
        
        if addSprinkles{
            cost += Decimal(quantity) / 2
        }
        return cost
        
    }
}
