//
//  ChartExample.swift
//  CarteiraDoPrimo
//
//  Created by Joao Gripp on 26/01/23.
//

import SwiftUI
import Charts

struct ChartExample: View {
    
    var data: [Dividend] = MockData.myDividends
    
    var body: some View {
        Chart {
            ForEach(data) { dividend in
                BarMark(
                    x: .value("Shape Type", dividend.date),
                    y: .value("Total Count", dividend.value)
                )
                .foregroundStyle(by: .value("Shape Color", dividend.type.rawValue))
            }
        }
        .chartForegroundStyleScale([
            "FII": .brown,
            "Ações Brasileiras": .green,
            "Ações Internacionais": .red,
            "Renda Fixa": .blue,
            "Aluguel de Ativos": .purple
        ])
        .padding(20)
    }
}

struct ChartExample_Previews: PreviewProvider {
    static var previews: some View {
        ChartExample()
    }
}

struct ToyShape: Identifiable {
    var color: String
    var type: String
    var count: Double
    var id = UUID()
}

struct Dividend: Identifiable {
    var id = UUID()
    var symbol: String
    var value: Double
    var date: String // change to Date
    var type: DividendTypes
}

enum DividendTypes: String {
    case fundoImobiliario = "FII"
    case stockBrazilian = "Ações Brasileiras"
    case stockUSA = "Ações Internacionais"
    case fixedRent = "Renda Fixa"
    case rental = "Aluguel de Ativos"
    
    var color: Color {
            switch self {
            case .fundoImobiliario:
                return .brown
            case .stockBrazilian:
                return .green
            case .stockUSA:
                return .red
            case .fixedRent:
                return .blue
            case .rental:
                return .purple
            }
        }
}

struct MockData {
    
    static var myDividends: [Dividend] = [
        .init(symbol: "ALZR11", value: 10, date: "Jan/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 11, date: "Fev/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 12, date: "Mar/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 13, date: "Abr/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 14, date: "Mai/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 15, date: "Jun/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 16, date: "Jul/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 17, date: "Ago/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 18, date: "Set/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 19, date: "Out/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 20, date: "Nov/2021", type: .fundoImobiliario),
        .init(symbol: "ALZR11", value: 21, date: "Dec/2021", type: .fundoImobiliario)
    
    ]
}



