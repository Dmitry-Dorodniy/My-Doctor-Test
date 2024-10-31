//
//  NoteView.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 29.10.2024.
//

import SwiftUI

struct NoteView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(.editIcon)
                Text("Заметки")
                    .padding(.leading)
                Spacer()
                Image(systemName: "plus")
                    .foregroundStyle(.secondary)
            }
            .padding(.top)
            .padding(.horizontal)
            Rectangle()
                .frame(height: 1)
                .foregroundStyle(.tertiary)
                .padding(.horizontal)
            TextField("Опиши своё состояние", text: .constant(""))
                .font(.footnote)
                .padding()
        }
    }
}

#Preview {
    NoteView()
}
