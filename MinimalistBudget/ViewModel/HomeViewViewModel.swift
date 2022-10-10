//
//  HomeViewViewModel.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import Foundation
import RealmSwift

class HomeViewViewModel: ObservableObject {
//    @Published var selectedLibrary: Library = .reading
    @Published var showSheet: Bool = false
    @Published var totalAmount: Double = 0
    @Published var needsAmount: Double = 0
    @Published var desiresAmount: Double = 0
    @Published var wishesAmount: Double = 0
    
    @Published var needsPercent: Double = 0
    @Published var desiresPercent: Double = 0
    @Published var wishesPercent: Double = 0
    
    @ObservedResults(Expense.self) var expenses
    @ObservedResults(Expense.self, where: { $0.category == .need }) var needs
    @ObservedResults(Expense.self, where: { $0.category == .desir }) var desires
    @ObservedResults(Expense.self, where: { $0.category == .wish }) var wishes
}

extension HomeViewViewModel {
    func calculateAmounts() {
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
    
    func calculatePercentages() {
        needsPercent = (needsAmount * 100) / totalAmount
        desiresPercent = (desiresAmount * 100) / totalAmount
        wishesPercent = (wishesAmount * 100) / totalAmount
    }
}
