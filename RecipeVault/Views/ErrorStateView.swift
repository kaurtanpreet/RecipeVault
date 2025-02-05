//
//  ErrorStateView.swift
//  RecipeVault
//
//  Created by Tanpreet Kaur on 2/3/25.
//

import SwiftUI

struct ErrorStateView: View {
    let message: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.title)
                .foregroundStyle(.gray)
            Text("\(message)")
                .font(.title2)
                .foregroundStyle(.gray)
                .padding(10)
        }
        .frame(minHeight: 700)
    }
}

#Preview {
    ErrorStateView(message: "An enexpected error occured.")
}
