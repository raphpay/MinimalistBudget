//
//  Double+Ext.swift
//  MinimalistBudget
//
//  Created by Raphaël Payet on 10/10/2022.
//

import Foundation

extension Double {
    /// Rounds the double to decimal places value
    func rounded(to places: Int) -> String {
        return String(format: "%.\(places)f", self)
    }
}
