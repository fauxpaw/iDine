//
//  CheckoutView.swift
//  iDine
//
//  Created by Michael Sweeney on 2/3/23.
//

import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var order: Order
    @State private var payementType = PaymentType.creditCard
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    
    let tipAmounts = [10, 15, 20, 25, 0]
    
    @State private var isConfirmationAlertVisible = false
    
    private var totalPrice: String {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        return (total + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        Form {
            Section {
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
                if addLoyaltyDetails {
                    TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                Picker("How do you want to pay?", selection: $payementType) {
                    ForEach(PaymentType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
            }
            
            Section("Add a tip") {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                }
                .pickerStyle(.segmented)
            }
            Section("Total: \(totalPrice)") {
                Button("Place Order") {
                    isConfirmationAlertVisible.toggle()
                }
            }
        }
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Order Confirmed", isPresented: $isConfirmationAlertVisible) {
            // add buttons here
        } message: {
            Text("Your total was \(totalPrice) - thank you!")
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            CheckoutView()
                .environmentObject(Order())
        }
    }
}
