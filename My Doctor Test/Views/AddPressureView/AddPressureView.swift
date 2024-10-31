//
//  AddPressure.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 29.10.2024.
//

import SwiftUI

struct AddPressureView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>

    @State private var pressureData = PressureData()
    
    var body: some View {
        ZStack {
            // Background
            VStack {
                HStack {
                    Spacer()
                    Image(.bg)
                }
                .padding(.top, 80)
            }
            .ignoresSafeArea()
            
            // TextFields
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        saveAndBack()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundStyle(.black)
                    }
                    .navigationBarBackButtonHidden()
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
                
                //TODO: Нужны проверки, чтобы показатели давления вводились только в допустимых пределах
                HStack {
                    TextField("120", text: $pressureData.systPressure)
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .keyboardType(.numberPad)
                        .onChange(of: pressureData.systPressure) {
                            pressureData.systPressure = String(pressureData.systPressure.prefix(3))
                            }
                    
                    TextField("80", text: $pressureData.diastPressure)
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading, 8)
                        .keyboardType(.numberPad)
                        .onChange(of: pressureData.diastPressure) {
                            pressureData.diastPressure = String(pressureData.diastPressure.prefix(3))
                            }
                    
                    TextField("60", text: .constant(""))
                        .padding(.leading)
                        .frame(width: 103, height: 45)
                        .background(Color.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding(.leading, 25)
                        .keyboardType(.numberPad)
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
                
                // Button
                Button {
                    saveAndBack()
                } label: {
                    Text("Сохранить")
                }
                .frame(maxWidth: .infinity, minHeight: 33)
                .background(pressureData.diastPressure.isEmpty || pressureData.systPressure.isEmpty ? Color.blue.opacity(0.3) : Color.blue.opacity(0.8))
                .foregroundStyle(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 14))
                .padding()
            }
        }
        .onTapGesture {
            self.endTextEditing()
        }
    }
}

extension AddPressureView {
    private func saveAndBack() {
        if !pressureData.diastPressure.isEmpty && !pressureData.systPressure.isEmpty {
            addPressure()
        }
        mode.wrappedValue.dismiss()
    }
    
    private func addPressure() {
        withAnimation {
            let newPressure = PressureEntity(context: viewContext)
            if let newValue = Int16(pressureData.systPressure) {
                newPressure.systPressure = newValue
            } else {
                return
            }
            
            if let newValue = Int16(pressureData.diastPressure) {
                newPressure.diastPressure = newValue
            }

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

#Preview {
    AddPressureView()
}

