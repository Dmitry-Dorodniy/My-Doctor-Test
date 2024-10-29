//
//  ContentView.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 28.10.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>
    
    @State private var selectedOption: Selection = Selection.day
        
    private enum Selection: String, CaseIterable {
        case day = "День"
        case week = "Неделя"
        case month = "Месяц"
    }

    var body: some View {
//        NavigationView {
//            List {
//                ForEach(items) { item in
//                    NavigationLink {
//                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
//                    } label: {
//                        Text(item.timestamp!, formatter: itemFormatter)
//                    }
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//            Text("Select an item")
//        }
        ZStack {
//            Бэкграунд
            VStack {
                HStack {
                    Spacer()
                    Image(.bg)
                }
                Spacer()
                    .padding()
            }
            .ignoresSafeArea()
            
//            Основные элементы
            VStack {
                //            Лого
                Image(.myDoctorLogo)
                //            Давление, дата, кнопка
                HStack {
                    ZStack {
                        VStack(alignment: .center, spacing: 4) {
                            Text("Давление")
                                .font(.title2)
                                .bold()
                            Text("\(formattedDate())")
                        }
                        HStack {
                            Spacer()
                            Button(action: {
                                // Действие для кнопки "+"
                            }) {
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
                
                //            Сегментед пикер
                Picker(selection: $selectedOption, label: Text("Picker")) {
                    ForEach(Selection.allCases, id: \.self)  { selection in
//                        Text(selection.rawValue).tag(selection)
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
                
                
                // основной график
                ChartView()
                    .background(Color(uiColor: UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(.horizontal)
                
                //Заметки
                NoteView()
                    .background(Color(uiColor: UIColor.systemBackground))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing: 15))
            }
            
                         }
    }
    
    /// Функция для форматирования текущей даты в формате месяц ГГГГ г.
       private func formattedDate() -> String {
           let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "LLLL yyyy 'г.'"
           dateFormatter.locale = Locale(identifier: "ru_RU")
           
           let date = Date() // Текущая дата
           return dateFormatter.string(from: date)
       }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
