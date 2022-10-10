//
//  HomeView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Title(totalAmount: 500)
                CategoryLine(text: "Besoins", color: .green)
                CategoryLine(text: "Désirs", color: .orange)
                CategoryLine(text: "Envies", color: .red)
            }
            .padding()
            .background(roundedBackground)
            
            Spacer()
            
            HStack {
                Spacer()
                PlusButton {
                    showSheet.toggle()
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .sheet(isPresented: $showSheet) {
            AmountView()
        }
    }
    
    var roundedBackground: some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous)
            .stroke()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
