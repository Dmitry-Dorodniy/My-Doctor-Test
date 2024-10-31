//
//  HeaderDataView.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 31.10.2024.
//

import SwiftUI

struct HeaderDataView: View {
    var body: some View {
        HStack {
            ZStack {
                VStack(alignment: .center, spacing: 4) {
                    Text("Давление")
                        .font(.title2)
                        .bold()
                    
                    //TODO: Формат отображения даты должен меняться в зависимости от выбранного сегмента в Picker
                    Text("\(Date().formattedMonthYYYYRus())")
                }
                HStack {
                    Spacer()
                    NavigationLink {
                        AddPressureView()
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 25, height: 25)
                            .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
                            .background(Color.white)
                            .foregroundStyle(.gray)
                            .fontWeight(.light)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    }
                }
                .padding(.trailing)
            }
        }
    }
}

#Preview {
    HeaderDataView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange.opacity(0.4))
}
