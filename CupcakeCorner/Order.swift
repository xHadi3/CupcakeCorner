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
    
    
    var name = "" {
        didSet{
            UserDefaults.standard.set(name, forKey: "Name")
            }
        }
    
    var streetAddress = "" {
          didSet {
              UserDefaults.standard.set(streetAddress, forKey: "StreetAddress")
          }
      }
      var city = "" {
          didSet {
              UserDefaults.standard.set(city, forKey: "City")
          }
      }
      var zip = "" {
          didSet {
              UserDefaults.standard.set(zip, forKey: "Zip")
          }
      }


    init() {
          // Retrieve all properties from UserDefaults if available
          if let savedName = UserDefaults.standard.string(forKey: "Name") {
              name = savedName
          }
          if let savedStreetAddress = UserDefaults.standard.string(forKey: "StreetAddress") {
              streetAddress = savedStreetAddress
          }
          if let savedCity = UserDefaults.standard.string(forKey: "City") {
              city = savedCity
          }
          if let savedZip = UserDefaults.standard.string(forKey: "Zip") {
              zip = savedZip
          }
      }
    
       
    
    
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
