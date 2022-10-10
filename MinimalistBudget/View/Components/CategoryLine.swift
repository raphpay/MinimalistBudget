//
//  CategoryLine.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct CategoryLine: View {
    let text: String
    let color: Color
    
    var body: some View {
        HStack {
            ZStack {
                Text(text.firstLetter)
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .foregroundColor(color)
                            .frame(width: 30, height: 30)
                    )
            }
            .frame(width: 30, height: 30)
            
            Text(text)
            
            Spacer()
            
            Text("55€")
                .bold()
        }
    }
}

struct CategoryLine_Previews: PreviewProvider {
    static var previews: some View {
        CategoryLine(text: "Besoin", color: .green)
    }
}
