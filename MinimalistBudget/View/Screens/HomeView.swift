//
//  HomeView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Title(totalAmount: viewModel.totalAmount)
                CategoryLine(text: "Besoins", color: .green, amount: viewModel.needsAmount)
                CategoryLine(text: "Désirs", color: .orange, amount: viewModel.desiresAmount)
                CategoryLine(text: "Envies", color: .red, amount: viewModel.wishesAmount)
                
                GeometryReader { geo in
                    ProgressBar(width: geo.size.width,
                                needsPercent: $viewModel.needsPercent,
                                desiresPercent: $viewModel.desiresPercent,
                                wishesPercent: $viewModel.wishesPercent)
                }
                .frame(height: 30)
            }
            .padding()
            .background(roundedBackground)
            
            Spacer()
            
            HStack {
                Spacer()
                PlusButton {
                    viewModel.showSheet.toggle()
                }
            }
            .padding()
        }
        .padding(.horizontal)
        .sheet(isPresented: $viewModel.showSheet) {
            AmountView(expense: Expense())
        }
        .onAppear {
            viewModel.calculateAmounts()
            viewModel.calculatePercentages()
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
