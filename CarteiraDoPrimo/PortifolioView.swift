//
//  PortifolioView.swift
//  CarteiraDoPrimo
//
//  Created by Joao Gripp on 26/01/23.
//

import SwiftUI

struct PortifolioView: View {
    
    @State private var shouldShowAddView = false
    
    var body: some View {
        NavigationView {
            Text("Add View")
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    shouldShowAddView.toggle()
                } label: {
                    Label("Add", systemImage: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
        }
        .sheet(isPresented: $shouldShowAddView) {
            PlusView()
        }
    }
}

struct ProtifolioView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            PortifolioView()
        }
    }
}
