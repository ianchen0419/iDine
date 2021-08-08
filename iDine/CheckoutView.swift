//
//  CheckoutView.swift
//  iDine
//
//  Created by Yi An Chen on 2021/8/7.
//  Copyright © 2021 cheyian. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    
    static let paymentTypes = ["Cash", "Credit Card", "iDine points"]
    static let tipAmounts = [10, 15, 20, 25, 0]
    static let timeTypes = ["Now", "Tonight", "Tomorrow Morning"]

    //使用@State讓picker被使用者選擇時可以即時改變paymentType的值
    @State private var paymentType = 0 //Cash by default
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 1 //15 by default
    @State private var showingPaymentAlert = false
    @State private var timeType = 0
    
    var totalPrice: Double {
        let total = Double(order.total)
        let tipValue = total / 100 * Double(Self.tipAmounts[tipAmount])
        return total + tipValue
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(0 ..< Self.paymentTypes.count) {
                        Text(Self.paymentTypes[$0])
                    }
                }
                
                Toggle(isOn: $addLoyaltyDetails) {
                    Text("Add iDine loyalty card")
                }
                
                if addLoyaltyDetails {
                   TextField("Enter your iDine ID", text: $loyaltyNumber)
                }
                
            }
            
            Section(header: Text("Add a tip?")) {
                Picker("Percentage:", selection: $tipAmount) {
                    ForEach(0 ..< Self.tipAmounts.count) {
                        Text("\(Self.tipAmounts[$0])%")
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            
            Section {
                Picker("Picker time:", selection: $timeType) {
                    ForEach(0 ..< Self.timeTypes.count) {
                        Text(Self.timeTypes[$0])
                    }
                }
                
            }
            
            Section(header: Text("TOTAL: $\(totalPrice, specifier: "%.2f")").font(.largeTitle)) {
                Button("Confirm Order") {
                    self.showingPaymentAlert.toggle()
                }
            }
        }
        .navigationBarTitle(Text("Payment"), displayMode: .inline)
        .alert(isPresented: $showingPaymentAlert) {
            Alert(title: Text("Order confirmed"), message: Text("Your total was $\(totalPrice, specifier: "%.2f") - thank you!"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static let order = Order()
    
    static var previews: some View {
        CheckoutView().environmentObject(order)
    }
}
