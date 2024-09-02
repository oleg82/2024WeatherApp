//
//  WeatherConditionView.swift
//  WeatherApp
//
//  Created by borispolevoj on 31.08.2024.
//

import SwiftUI

struct WeatherСonditionView: View {
    @Environment(\.dismiss) var dismiss
    var condition: WeatherСondition
    
    var body: some View {
        VStack {
            Image(systemName: condition.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(40)
                .overlay {
                    RoundedRectangle(cornerRadius: 40)
                        .stroke(.black, lineWidth: 5)
                        .padding(10)
                }
        }
        .navigationTitle(condition.text)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.uturn.left")
                        .foregroundStyle(.black)
                }
            }
        }
    }
}

#Preview {
    WeatherСonditionView(condition: WeatherСondition(text: "Солнечно", imageName: "sun.max.fill"))
}
