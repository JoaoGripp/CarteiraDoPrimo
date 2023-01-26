//
//  PlusView.swift
//  CarteiraDoPrimo
//
//  Created by Joao Gripp on 26/01/23.
//

import SwiftUI

struct PlusView: View {
    var body: some View {
        NavigationView {
            Text("Add View")
        }
        .toolbar {
            Button {
                
            } label: {
                Label("Add", systemImage: "plus.circle.fill")
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
