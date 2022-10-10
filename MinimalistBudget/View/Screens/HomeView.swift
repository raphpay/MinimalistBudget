//
//  HomeView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showSheet: Bool = false
    @State private var totalAmount: Double = 500
    @State private var needsAmount: Double = 55
    @State private var desiresAmount: Double = 65
    @State private var wishesAmount: Double = 80
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Title(totalAmount: totalAmount)
                CategoryLine(text: "Besoins", color: .green, amount: needsAmount)
                CategoryLine(text: "Désirs", color: .orange, amount: desiresAmount)
                CategoryLine(text: "Envies", color: .red, amount: wishesAmount)
                
                GeometryReader { geo in
                    let needsPercent = (needsAmount * 100) / totalAmount
                    let desiresPercent = (desiresAmount * 100) / totalAmount
                    let wishesPercent = (wishesAmount * 100) / totalAmount
                    
                    ProgressBar(width: geo.size.width,
                                needsPercent: needsPercent,
                                desiresPercent: desiresPercent,
                                wishesPercent: wishesPercent)
                }
                .frame(height: 30)
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
