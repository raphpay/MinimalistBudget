 //
//  ProgressBar.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct ProgressBar: View {
    
    let height: CGFloat = 20
    var width: CGFloat = 200
    @State var needsPercent: CGFloat = 29
    @State var desiresPercent: CGFloat = 39
    @State var wishesPercent: CGFloat = 19
    
    var body: some View {
        
        let multiplier = width / 100
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: width, height: height)
                .foregroundColor(.black.opacity(0.1))
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: desiresPercent * multiplier, height: height)
                .foregroundColor(.red)
                .offset(x: (needsPercent * multiplier + wishesPercent * multiplier))
                .animation(.spring(), value: desiresPercent)
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: wishesPercent * multiplier, height: height)
                .foregroundColor(.orange)
                .offset(x: (needsPercent * multiplier))
                .animation(.spring(), value: wishesPercent)
            
            RoundedRectangle(cornerRadius: height, style: .continuous)
                .frame(width: needsPercent * multiplier, height: height)
                .foregroundColor(.green)
                .animation(.spring(), value: needsPercent)
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar()
    }
}
