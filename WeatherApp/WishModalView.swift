//
//  WishModalView.swift
//  WeatherApp
//
//  Created by borispolevoj on 31.08.2024.
//

import SwiftUI

struct WishModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            Text("Желаю всегда только хорошей погоды и хорошего настроения!")
                .font(.system(.title3))
                .bold()
                .padding(30)
            Button("Закрыть") {
                dismiss()
            }
            .foregroundColor(.black)
            .cornerRadius(40)
        }
    }
}
