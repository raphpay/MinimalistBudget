//
//  HomeView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI
import RealmSwift

struct HomeView: View {
    
    @State private var showSheet: Bool = false
    @State private var totalAmount: Double = 500
    @State private var needsAmount: Double = 55
    @State private var desiresAmount: Double = 65
    @State private var wishesAmount: Double = 80
    @ObservedResults(Expense.self) var expenses
    @ObservedResults(Expense.self, where: { $0.category == .need }) var needs
    @ObservedResults(Expense.self, where: { $0.category == .desir }) var desires
    @ObservedResults(Expense.self, where: { $0.category == .wish }) var wishes
    
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
            
            Text("Needs")
                .bold()
            ForEach(needs) { need in
                HStack {
                    Text(need.title)
                    Text("\(need.amount.rounded(to: 2))")
                }
            }
            
            Text("Desires")
                .bold()
            ForEach(desires) { desir in
                HStack {
                    Text(desir.title)
                    Text("\(desir.amount.rounded(to: 2))")
                }
            }
            
            Text("Wishes")
                .bold()
            ForEach(wishes) { wish in
                HStack {
                    Text(wish.title)
                    Text("\(wish.amount.rounded(to: 2))")
                }
            }
            
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
            AmountView(expense: Expense())
        }
        .onAppear {
            var total: Double = 0
            var needs: Double = 0
            var desires: Double = 0
            var wishes: Double = 0
            
            for expense in expenses {
                total += expense.amount
                
                switch expense.category {
                case .need:
                    needs += expense.amount
                case .desir:
                    desires += expense.amount
                case .wish:
                    wishes += expense.amount
                }
            }
            totalAmount = total
            needsAmount = needs
            desiresAmount = desires
            wishesAmount = wishes
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
