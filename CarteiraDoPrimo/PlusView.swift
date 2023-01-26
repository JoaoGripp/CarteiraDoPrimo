//
//  PlusView.swift
//  CarteiraDoPrimo
//
//  Created by Joao Gripp on 26/01/23.
//

import SwiftUI

struct PlusView: View {
    
    @State private var assetValueInput: String = ""
    @State private var assetSymbolInput: String = ""
    @State private var assetIndex = 0
    var assetsOptions = ["Caixa", "Ações Brasileiras", "Ações Estrangeiras", "FII", "Proventos"]
    
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Valor")
                    Spacer()
                    TextField("Value", text: $assetValueInput)
                    
                }
                .padding(.horizontal, 20)
                
                HStack {
                    Text("Simbolo")
                    Spacer()
                    TextField("Simbolo", text: $assetSymbolInput)
                    
                }
                .padding(.horizontal, 20)
                
                Picker(selection: $assetIndex, label: Text("Tipo de Ativo")) {
                    ForEach(0 ..< assetsOptions.count) {
                        Text(self.assetsOptions[$0])
                    }
                }
                Spacer()
                
                Button(action: {
                    print("Perform an action here...")
                }) {
                    Label("Save", systemImage: "dollarsign.circle.fill")
                }
                
                Spacer()
            }
            
        }
    }
}

struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PlusView()
        }
    }
}

struct Asset: Identifiable {
    var assetType: AssetType
    var symbol: String
    var value: Double
    var date: Date

    var id = UUID()
    
    init(assetType: AssetType, symbol: String, value: Double, dateYear: Int, dateMonth: Int, dateDay: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = dateYear
        dateComponents.month = dateMonth
        dateComponents.day = dateDay
        self.date = Calendar.current.date(from: dateComponents) ?? Date.now
        self.value = value
        self.assetType = assetType
        self.symbol = symbol
    }
}

enum AssetType {
    case money
    case stockBR
    case stockUSA
    case realAsset
    case dividend
}
