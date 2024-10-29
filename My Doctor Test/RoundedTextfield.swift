//
//  RoundedTextfield.swift
//  My Doctor Test
//
//  Created by Dmitry Dorodniy on 29.10.2024.
//

import SwiftUI

struct RoundedTextfield: View {
    var placeholder: String = ""
    
    
    var body: some View {
        TextField(placeholder, text: .constant(""))
            .padding(.leading)
            .frame(width: 103, height: 45)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    RoundedTextfield(placeholder: "Placeholder")
        .background(Color.gray)
        .frame(width: .infinity, height: .infinity)
}
