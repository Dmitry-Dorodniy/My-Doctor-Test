//
//  MainView.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 30.10.2024.
//

import SwiftUI
import CoreData

struct MainView: View {
    @FetchRequest(fetchRequest: PressureEntity.fetch(), animation: .default)
    private var pressures: FetchedResults<PressureEntity>
    
    @State private var selectedOption: Period = Period.month
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Background
                VStack {
                    HStack {
                        Spacer()
                        Image(.bg)
                    }
                    Spacer()
                        .padding()
                }
                .ignoresSafeArea()
                
                // Common UI elements
                VStack {
                  
                    Image(.myDoctorLogo)
                    // Давление, дата, кнопка
                    HeaderDataView()
                    
                    // Segmented picker
                    //TODO: Нужен кастомный вид для переключателя внутри
                    Picker(selection: $selectedOption, label: Text("Picker")) {
                        ForEach(Period.allCases, id: \.self)  { selection in
                            Button {
                                selectedOption = selection
                            } label: {
                                Text(selection.rawValue)
                            }
                        }
                    }
                    .pickerStyle(.segmented)
                    .background(Color(uiColor: UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                    
                    // Основной график
                    ChartView(pressures: pressures)
                        .background(Color(uiColor: UIColor.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(.horizontal)
                    
                    // Заметки
                    NoteView()
                        .background(Color(uiColor: UIColor.systemBackground))
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
                }
                
            }
        }
    }
}

fileprivate enum Period: String, CaseIterable {
    case day = "День"
    case week = "Неделя"
    case month = "Месяц"
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
