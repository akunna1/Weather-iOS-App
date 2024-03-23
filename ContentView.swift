//
//  ContentView.swift
//  WeatherApp
//
//  Created by Amarachi Akunna Onyekachi on 3/22/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false // for changing to dark mode
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack { // Main VStack
                CityTextView(cityName: "Oyem, Gabon")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 28)
                
                HStack(spacing: 20) { // HStack for weather forecast
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.max.fill", temperature: 33)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 36)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.bolt.fill", temperature: 21)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.bolt.rain.fill", temperature: 16)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.rain.fill", temperature: 18)
                } // End of HStack for weather forecast
                
                Spacer() // Spacer to push content to the top
                
                Button { // Button to change day time
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                } // End of Button
                
                Spacer() // Spacer to push content to the bottom
            } // End of Main VStack
        } // End of ZStack
    }
}

struct ContentView_Previews: PreviewProvider { // Preview for ContentView
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View { // View for displaying weather for a day
    
    var dayOfWeek: String // Day of the week
    var imageName: String // Image representing the weather
    var temperature: Int // Temperature
    
    var body: some View {
        VStack { // VStack for weather information
            Text(dayOfWeek) // Display day of the week
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName) // Display weather icon
                .renderingMode(.original) // makes it colored
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)°") // Display temperature
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View { // View for background gradient
    
    @Binding var isNight: Bool

    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), // Gradient background
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all) // Ignore safe area for full-screen background
    }
}


struct CityTextView: View { // View for displaying city name
    
    var cityName: String // Name of the city
    
    var body: some View {
        Text(cityName) // Display city name
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding() // Add padding around text
    }
}


struct MainWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) { // VStack for weather icon and temperature
            Image(systemName: imageName) // Weather icon
                .renderingMode(.original) // makes it colored
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)°") // Temperature
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        } //End of VStack
        .padding(.bottom, 40) // Add padding to bottom
    }
}
