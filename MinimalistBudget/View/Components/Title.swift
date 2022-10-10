//
//  Title.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct Title: View {
    var totalAmount: Double
    
    var body: some View {
        HStack {
            Text("Total Dépensé")
                .bold()
                .font(.title2)
            Spacer()
            Text("\(totalAmount.rounded(to: 2))€")
                .bold()
                .font(.title2)
        }
    }
}
struct Title_Previews: PreviewProvider {
    static var previews: some View {
        Title(totalAmount: 500)
    }
}
