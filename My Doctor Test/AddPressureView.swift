//
//  AddPressure.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 29.10.2024.
//

import SwiftUI

struct AddPressureView: View {
    var body: some View {
        ZStack {
            // фон
            VStack {
                //
            }
            
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        //
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.black)
                    }
                    .frame(width: 30, height: 30)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    Text("Добавить данные")
                        .font(.title3)
                        .bold()
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom)
                
                HStack {
                    Text("Кровяное давление")
                    Text("Пульс")
                        .padding(.leading, 100)
                }
                .font(.callout)
                .padding(.horizontal)
                
                HStack {
                    Text("Систалическое")
                    Text("Диастолическое")
                        .padding(.leading)
                }
                .font(.footnote)
                .foregroundStyle(Color.gray)
                .padding(.horizontal)
                
                HStack {
                    TextField("120", text: .constant(""))
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField("90", text: .constant(""))
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading, 8)
                    
                    TextField("90", text: .constant(""))
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading, 25)
                }
                .padding(.horizontal)
                
                HStack {
                    Text("Дата измерения")
                    Text("Время измерения")
                        .padding(.leading, 50)
                }
                .font(.callout)
                .padding(.top)
                .padding(.horizontal)
                
                HStack(alignment: .center, spacing: 25) {
                    TextField(Date().formatted(date: .numeric, time: .omitted), text: .constant(""))
                        .padding(.leading)
                        .frame(width: 150, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    TextField(Date().formatted(date: .omitted, time: .shortened), text: .constant(""))
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading, 8)
                }
                .padding(.horizontal)
                
                Text("Заметка")
                    .padding(.top)
                    .padding(.leading)
                
                TextField("Опишите своё самочуствие", text: .constant(""))
                    .padding(.leading)
                    .frame(height: 45)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding(.horizontal)
                
                Spacer()
                
                Button {
                    //
                } label: {
                    Text("Сохранить")
                }
                .frame(maxWidth: .infinity, minHeight: 33)
                .background(Color.blue.opacity(0.3))
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding()
            }
        }
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    AddPressureView()
}
