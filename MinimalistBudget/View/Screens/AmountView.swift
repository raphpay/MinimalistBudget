//
//  AmountView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct AmountView: View {
    
    @State private var category = "Besoins"
    @State private var amount = ""
    let categories = ["Besoins", "Désirs", "Envies"]
    
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $category) {
                ForEach(categories, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Montant", text: $amount)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            Button {
                //
            } label: {
                Text("Entrer la dépense")
            }

            
            Spacer()
        }
        .padding()
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView()
    }
}
