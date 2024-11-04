//
//  SegmentedPicker.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 04.11.2024.
//

import SwiftUI

struct SegmentedPicker: View {
    @State private var selectedItem: Period? = .month
    
    var body: some View {
        VStack {
            CustomSegmentedControl(Period.allCases, selection: selectedItem) { item in
                Text(item.rawValue.capitalized)
                    .font(selectedItem == item ? Font.footnote.weight(.bold) : Font.footnote.weight(.regular) )
                    .padding(.vertical, 8)
                    .padding(.horizontal, 8)
                    .frame(maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.150)) {
                            selectedItem = item
                        }
                    }
            }
            .pickerBackgroundColor(.white)
            .cornerRadius(20)
            .accentColor(.gray.opacity(0.1))
        }
        
    }
}

fileprivate enum Period: String, CaseIterable {
    case day = "День"
    case week = "Неделя"
    case month = "Месяц"
}

#Preview {
    SegmentedPicker()
        .padding()
        .background(Color.gray.opacity(0.5))
}
