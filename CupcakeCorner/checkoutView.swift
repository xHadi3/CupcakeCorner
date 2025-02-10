//
//  checkoutView.swift
//  CupcakeCorner
//
//  Created by Hadi Al zayer on 11/08/1446 AH.
//

import SwiftUI

struct checkoutView: View {
    var order:Order
    var body: some View {
        ScrollView{
            VStack{
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3){ image in
                    image
                        .resizable()
                        .scaledToFit()
                    
                }placeholder: {
                    ProgressView()
                }
                .frame(height: 223)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order", action: {})
                    .padding()
            }
        }
        .navigationTitle("Check out")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
    }
}

#Preview {
    checkoutView(order: Order())
}
