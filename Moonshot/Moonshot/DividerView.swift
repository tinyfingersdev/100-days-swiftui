//
//  DividerView.swift
//  Moonshot
//
//  Created by Shannon Paige on 2/14/24.
//

import SwiftUI

struct DividerView: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    DividerView()
}
