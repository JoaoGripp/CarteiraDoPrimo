//
//  MainView.swift
//  CarteiraDoPrimo
//
//  Created by Joao Gripp on 26/01/23.
//

import SwiftUI

struct MainView: View {
//    @StateObject private var viewModel = AppTabViewModel()
    
    var body: some View {
        TabView {
            SummaryView()
                .tabItem { Label("Sumário", systemImage: "list.bullet") }
            
            PortifolioView()
                .tabItem { Label("Portifolio", systemImage: "chart.pie") }
            
            DividendsView()
                .tabItem { Label("Proventos", systemImage: "chart.bar") }
            
            HistoryView()
                .tabItem { Label("History", systemImage: "chart.xyaxis.line") }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
