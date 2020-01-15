//
//  MoneyInput.swift
//  Tip Calculator
//
//  Created by Paul Pan on 20/14/1.
//  Copyright © 2020 Paul Pan. All rights reserved.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct MoneyInput: View {
    @State private var amount: String = ""
    @State private var selectionIndex: Int = 0
    @State private var tipAmount = ["10%", "15%", "20%"]
    private var calculatedColor: Color {
        var currentColor = Color.green
        currentColor = currentColor.opacity(0.4)
        return currentColor
    }
    private let curDimension: CGFloat = 15
    private let frameHeight: CGFloat = 52
    func calculateTip() -> Double {
        var result = Double(amount) ?? 0
        result = result * (0.1 + Double(selectionIndex) * 0.05)
        return result
    }
    func calculateTotal() -> Double {
        var result = Double(amount) ?? 0
        result = result * (1.1 + Double(selectionIndex) * 0.05)
        return result
    }
    var body: some View {
        VStack {
            VStack{
                TextField("$", text: $amount).keyboardType(.decimalPad).font(.system(size: 78)).multilineTextAlignment(.trailing)
                Spacer()
                Picker("Tip Amount", selection: $selectionIndex) {
                    ForEach(0 ..< tipAmount.count) {index in
                        Text(self.tipAmount[index]).tag(index)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            .padding(.all)
            VStack{
                HStack {
                    Text("+").font(.system(size: 20))
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTip()))").font(.system(size: 20))
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal()))").font(.system(size: 70)).frame(height: frameHeight)
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal() * 2))").font(.system(size: 60)).frame(height: frameHeight)
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal() * 3))").font(.system(size: 50)).frame(height: frameHeight)
                }
                HStack {
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Image("Person").resizable().aspectRatio(1, contentMode: .fit).frame(width: curDimension, height: curDimension)
                    Spacer()
                    Text("\(String(format: "%.2f", calculateTotal() * 4))").font(.system(size: 40)).frame(height: frameHeight)
                }
            }
            .padding(.all)
            .background(Color.green)
            .onTapGesture {
                UIApplication.shared.endEditing()
            }
        }.background(calculatedColor)
    }
}

struct MoneyInput_Previews: PreviewProvider {
    static var previews: some View {
        MoneyInput()
    }
}
