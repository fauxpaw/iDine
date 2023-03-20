//
//  PaymentTypes.swift
//  iDine
//
//  Created by Michael Sweeney on 2/3/23.
//

import Foundation

enum PaymentType: String, CaseIterable {
    case cash = "Cash"
    case creditCard = "Credit Card"
    case iDinePoints = "iDine Points"
}
