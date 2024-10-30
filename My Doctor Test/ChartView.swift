//
//  ChartView.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 29.10.2024.
//

import SwiftUI

struct ChartView: View {
    @Binding var pressure: String
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Нет данных")
                    .font(.title)
                    .bold()
                Text("Сегодня \(pressure)")
                    .padding(.top)
                Rectangle().frame(height: 1)
                    .background(Color.secondary)
                    .padding(.top)
                HStack(spacing: 10) {
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.red)
                    Text("Систолическое")
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundColor(.orange)
                    Text("Диастолическое")
                }
                .padding(.top)
                Image(.graph)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top)
                
                HStack() {
                    Spacer()
                    NavigationLink {
                        AddPressureView(pressure: $pressure)
                    } label: {
                        Text("Добавить данные")
                            .foregroundStyle(.red)
                            .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                            .background(RoundedRectangle(cornerRadius: 30)
                                .stroke(.red, lineWidth: 1))
                    }
                }
                .padding(.top)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

#Preview {
    struct ChartViewExamplePreview: View {
        @State var pressure: String = "120"
        
        var body: some View {
            ChartView(pressure: $pressure)
        }
    }
    return ChartViewExamplePreview()
}
