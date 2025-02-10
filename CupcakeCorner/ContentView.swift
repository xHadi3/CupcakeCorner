//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Hadi Al zayer on 10/08/1446 AH.
//

import SwiftUI

struct ContentView: View {
  @State private var order = Order()
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    Picker("Select your cake type", selection: $order.type){
                        ForEach(Order.types.indices, id: \.self){
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes: \(order.quantity)", value: $order.quantity, in: 3...20)
                }
                
                Section{
                    Toggle("Any special requests?", isOn: $order.specialRequestEnabled.animation())
                    
                    if order.specialRequestEnabled{
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                        Toggle("Add extra sprinkes", isOn: $order.addSprinkes)
                    }
                }
                Section{
                    NavigationLink("Delivary details"){
                        AddressView(order: order)
                    }
                }
            }
            .navigationTitle("CupCake Corner")
        }
    }
}

#Preview {
    ContentView()
}
