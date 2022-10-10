//
//  PlusButton.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct PlusButton: View {
    
    var action: (() -> Void)?
    
    var body: some View {
        Button {
            action?()
        } label: {
            ZStack {
                Circle().frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }
        }

    }
}


struct PlusButton_Previews: PreviewProvider {
    static var previews: some View {
        PlusButton()
    }
}
