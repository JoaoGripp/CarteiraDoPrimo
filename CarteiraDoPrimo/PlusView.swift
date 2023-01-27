//
//  PlusView.swift
//  CarteiraDoPrimo
//
//  Created by Joao Gripp on 26/01/23.
//

import SwiftUI

struct PlusView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var assetValueInput: String = ""
    @State private var assetSymbolInput: String = ""
    @State private var assetIndex = 0
    var assetsOptions = ["Caixa", "Ações Brasileiras", "Ações Estrangeiras", "FII", "Proventos"]
    
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                HStack(spacing: 20) {
                    Image(systemName: "brazilianrealsign.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "building.2.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "arrow.up.heart.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                }
                .padding(20)
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
                    Image(systemName: "brazilianrealsign.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "house.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "dollarsign.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "building.2.crop.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                    Image(systemName: "arrow.up.heart.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
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
            .navigationTitle("Adicionar Ativo")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
            
        }
    }
}

struct PlusView_Previews: PreviewProvider {
    static var previews: some View {
            PlusView()
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
