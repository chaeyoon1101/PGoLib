//
//  SegmentedControlView.swift
//  PokemonGoLibrary
//
//  Created by 임채윤 on 5/13/24.
//

import SwiftUI

struct SegmentedControlView: View {
    @Binding var segments: [String]
    @Binding var selectedIndex: Int
    
    @Namespace var name

    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments.indices, id: \.self) { index in
                Button {
                    selectedIndex = index
                } label: {
                    VStack {
                        Text(segments[index])
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(selectedIndex == index ? .primary: Color(uiColor: .systemGray))
                        ZStack {
                            Capsule()
                                .fill(Color.clear)
                                .frame(height: 4)
                            if selectedIndex == index {
                                Capsule()
                                    .fill(Color.primary)
                                    .frame(height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

#Preview {
    SegmentedControlView(segments: .constant(["111", "2222", "3333", "444"]), selectedIndex: .constant(0))
}
