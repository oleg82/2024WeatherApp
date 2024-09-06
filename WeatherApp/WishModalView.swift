//
//  WishModalView.swift
//  WeatherApp
//
//  Created by borispolevoj on 31.08.2024.
//

import SwiftUI

struct LabelView: UIViewRepresentable {
    var text: String

    func makeUIView(context: UIViewRepresentableContext<LabelView>) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 30)
        label.lineBreakMode = .byWordWrapping
        label.preferredMaxLayoutWidth = 100
        label.textAlignment = .center
        return label
    }

    func updateUIView(_ uiView: UILabel, context: UIViewRepresentableContext<LabelView>) {
        uiView.text = text
    }
}

struct WishModalView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack {
            LabelView(text: "Желаю всегда только хорошей погоды и хорошего настроения!")
                .padding(30)
            Button("Закрыть") {
                dismiss()
            }
            .foregroundColor(.black)
            .cornerRadius(40)
        }
    }
}
