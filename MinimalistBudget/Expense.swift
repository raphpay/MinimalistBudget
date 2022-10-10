//
//  Expense.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import Foundation
import RealmSwift

class Expense: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var date: Date
    @Persisted var amount: Double
    @Persisted var title: String
    @Persisted var category: Category
    
    enum Category: String, PersistableEnum {
        case need, desir, wish
        
        var title: String {
            switch self {
            case .need:
                return "Needs"
            case .desir:
                return "Desires"
            case .wish:
                return "Wishes"
            }
        }
    }
}

enum ExpenseMock {
    
    static var need: Expense {
        let need = Expense()
        need.amount = 50
        need.title = "Manger"
        need.date = Date.now
        return need
    }
}
