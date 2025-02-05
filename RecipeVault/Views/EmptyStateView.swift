//
//  EmptyStateView.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        Group {
            Text("No recipes available.")
                .font(.title2)
                .foregroundStyle(.gray)
        }
        .frame(minHeight: 700)
    }
}

#Preview {
    EmptyStateView()
}
