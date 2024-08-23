//
//  BarGraphView.swift
//  PGoLib
//
//  Created by 임채윤 on 8/22/24.
//

import SwiftUI

struct BarGraphView: View {
    let value: CGFloat
    let barColor: Color
    
    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8)
                    .fill(barColor.opacity(0.3))
                    .frame(width: proxy.size.width, height: proxy.size.height)
                
                RoundedRectangle(cornerRadius: 8)
                    .fill(barColor)
                    .frame(width: proxy.size.width * (value / 100), height: proxy.size.height - 4)
            }
        }
        .frame(height: 8)
    }
}

#Preview {
    BarGraphView(value: 40, barColor: .cyan)
}
