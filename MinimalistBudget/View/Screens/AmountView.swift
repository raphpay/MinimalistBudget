//
//  AmountView.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import SwiftUI
import RealmSwift

struct AmountView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.realm) var realm
    @ObservedRealmObject var expense: Expense
    
    let categories = ["Besoins", "Désirs", "Envies"]
    
    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $expense.category) {
                ForEach(Expense.Category.allCases, id: \.self) { category in
                    Text(category.title)
                }
            }
            .pickerStyle(.segmented)
            
            TextField("Intitulé", text: $expense.title)
                .textFieldStyle(.roundedBorder)
            
            TextField("Montant", value: $expense.amount, format: .number)
                .keyboardType(.decimalPad)
                .textFieldStyle(.roundedBorder)
            
            Button {
                saveExpense()
            } label: {
                Text("Entrer la dépense")
            }

            
            Spacer()
        }
        .padding()
        .onAppear {
            print("Expense = \(expense)")
        }
    }
    
    func saveExpense() {
        guard expense.amount > 0 else { return }
        try? realm.write {
          realm.add(expense)
        }
        dismiss()
    }
}

struct AmountView_Previews: PreviewProvider {
    static var previews: some View {
        AmountView(expense: ExpenseMock.need)
    }
}
