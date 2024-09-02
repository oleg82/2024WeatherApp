//
//  WeatherСonditionsView.swift
//  WeatherApp
//
//  Created by borispolevoj on 31.08.2024.
//

import SwiftUI

struct СonditionCell: View {
    var condition: WeatherСondition
    
    var body: some View {
        HStack {
            Image(systemName: condition.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
                .padding()
            Text("\(condition.text)")
                .font(.system(.title3))
                .bold()
        }
    }
}

struct WeatherСonditionsView: View {
    
    @Binding var showModalСonditionView: Bool
    var weatherСonditions: [WeatherСondition]
    var modalСondition: WeatherСondition? = nil
    
    var body: some View {
        NavigationView {
            List(weatherСonditions) { condition in
                NavigationLink(destination: WeatherСonditionView(condition: condition)) {
                    СonditionCell(condition: condition)
                        .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Состояния погоды")
            .sheet(isPresented: $showModalСonditionView) {
                if let condition = modalСondition {
                    WeatherСonditionView(condition: condition)
                }
            }
        }
    }
}
