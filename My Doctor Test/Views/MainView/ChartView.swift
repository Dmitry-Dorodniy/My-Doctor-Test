//
//  ChartView.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 29.10.2024.
//

import SwiftUI
import Charts

struct ChartView: View {
    var pressures: FetchedResults<PressureEntity>
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 3) {
                Text("Нет данных")
                    .font(.title)
                    .bold()
                Text("Сегодня")
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
                
        //TODO:  Здесь должен быть график давлений (можно использовать Charts, но выводится просто столбик значений для проверки CoreData
                ZStack {
                    VStack {
                        ForEach(pressures, id: \.self) { pressure in
                            HStack {
                                Text(String(pressure.systPressure))
                                    .font(.footnote)
                                    .foregroundStyle(.red)
                                Text(String(pressure.diastPressure))
                                    .font(.footnote)
                                    .foregroundStyle(.blue)
                            }
                        }
                    }
                                        Image(.graph)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                            .padding(.top)
                }
                
                HStack() {
                    Spacer()
                    NavigationLink {
                        AddPressureView()
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
    let viewContext = PersistenceController(inMemory:true).viewContext
    
    for i in 120..<125 {
        let newItem = PressureEntity(context: viewContext)
        newItem.diastPressure = Int16(i)
        newItem.systPressure = Int16(i - 40)
    }
    viewContext.saveContext()
    return MainView().environment(\.managedObjectContext, viewContext)
}
