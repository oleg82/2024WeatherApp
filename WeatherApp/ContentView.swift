//
//  ContentView.swift
//  WeatherApp
//
//  Created by borispolevoj on 31.08.2024.
//

import SwiftUI

enum ScreenTab {
    case favoriteСondition, weatherСonditions, wishGoodWeather
}

struct WeatherСondition: Identifiable {
    var id = UUID()
    let text: String
    let imageName: String
}

struct ContentView: View {
    @State private var isModal = false
    @State private var isShowSunСondition = false
    @State private(set) var currentTab: ScreenTab = .favoriteСondition
    
    static var sunWeatherСondition = WeatherСondition(text: "Солнечно", imageName: "sun.max.fill")
    private(set) var weatherСonditions: [WeatherСondition] = [
        ContentView.sunWeatherСondition,
        WeatherСondition(text: "Дождливо", imageName: "cloud.drizzle.fill"),
        WeatherСondition(text: "Облачно", imageName: "cloud.sun.fill"),
        WeatherСondition(text: "Снежно", imageName: "cloud.snow.fill"),
        WeatherСondition(text: "Гроза", imageName: "cloud.bolt.fill"),
        WeatherСondition(text: "Ветренно", imageName: "wind"),
    ]
    
    var body: some View {
        TabView(selection: $currentTab) {
            VStack {
                Button(action: {
                    isShowSunСondition.toggle()
                    currentTab = .weatherСonditions
                }) {
                    Text("Cолнечная погода")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [.white, .orange]), startPoint: .top, endPoint: .bottom))
                        .cornerRadius(40)
                        .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
                }
            }
            .tabItem {
                Label("Любимая погода", systemImage: "heart.fill")
            }
            .tag(ScreenTab.favoriteСondition)
            WeatherСonditionsView(showModalСonditionView: $isShowSunСondition, weatherСonditions: weatherСonditions, modalСondition: ContentView.sunWeatherСondition)
                .tabItem {
                    Label("Состояние погоды", systemImage: "cloud.sun.rain.fill")
                }
                .tag(ScreenTab.weatherСonditions)
            VStack {
                Button(action: {
                    isModal.toggle()
                }) {
                    Text("Просмотреть пожелание")
                        .fontWeight(.semibold)
                        .font(.title)
                        .padding()
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(40)
                        .shadow(color: .gray, radius: 20.0, x: 20, y: 10)
                }
                .sheet(isPresented: $isModal) {
                    WishModalView().ignoresSafeArea(.all, edges: .top)
                }
            }
            .tabItem {
                Label("Пожелание", systemImage: "envelope.badge")
            }
            .tag(ScreenTab.wishGoodWeather)
        }
    }
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "AmericanTypewriter-CondensedBold", size: 35) ?? UIFont()]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.black, .font: UIFont(name: "AmericanTypewriter-CondensedBold", size: 20) ?? UIFont()]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }
}

#Preview {
    ContentView()
}
