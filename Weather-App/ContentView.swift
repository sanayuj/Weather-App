//
//  ContentView.swift
//  Weather-App
//
//  Created by Sanay UJ on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight=false
    
    struct WeatherDay {
        var weekName: String
        var temperature: Int
        var imageName: String
    }

    
    let weatherData: [WeatherDay] = [
        WeatherDay(weekName: "Mon", temperature: 23, imageName: "cloud.sun.fill"),
        WeatherDay(weekName: "Tue", temperature: 32, imageName: "cloud.rain.fill"),
        WeatherDay(weekName: "Wed", temperature: 23, imageName: "wind"),
        WeatherDay(weekName: "Thu", temperature: 23, imageName: "cloud.sun.fill"),
        WeatherDay(weekName: "Fri", temperature: 23, imageName: "cloud.sun.bolt.fill")
    ]

    
    var body: some View {
        ZStack{
            BackgroundView(isNight: $isNight)
            VStack{
                
                CityName(cityName: "Malappuram,Kerala")
                
                MainCityTemperture(TempImage: isNight ? "cloud.moon.fill":"cloud.sun.fill", TempCount: isNight ? 25:28)
               
                
                HStack{
                    WhetherDayView(weekName:"Mon",temperture:23,imageName:"cloud.sun.fill")
                    WhetherDayView(weekName:"Tue",temperture:32,imageName:"cloud.rain.fill")
                    WhetherDayView(weekName:"Wed",temperture:23,imageName:"wind")
                    WhetherDayView(weekName:"Thu",temperture:23,imageName:"cloud.sun.fill")
                    WhetherDayView(weekName:"Fri",temperture:23,imageName:"cloud.sun.bolt.fill")
                
               
                 
                }.padding(.top,30)
                Spacer()
                Button{
                    isNight.toggle()
                }label:{
                    BtnLabel(btnText: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
               
                
               
            }}
    }
}

#Preview {
    ContentView()
}




//Week Name

struct WhetherDayView: View {
    
    var weekName:String
    var temperture:Int
    var imageName:String
    
    var body: some View {
        VStack{
            Text(weekName).font(.system(size: 20,weight: .medium)).foregroundColor(.white)
            Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width:40,height: 40)
            Text(" \(temperture)°C").font(.system(size: 19,weight: .medium)).foregroundColor(.white)
            
        }.padding(.leading,15)
    }
}

//Mode

struct BackgroundView:View {
    
    @Binding var isNight:Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black:.blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
    }
}


//City Name

struct CityName:View {
    var cityName:String
    var body: some View {
        Text(cityName).font(.system(size:32,weight: .medium)).foregroundColor(.white)
            .padding()
       
    }
}


//Main Temperture

struct MainCityTemperture:View {
    var TempImage:String
    var TempCount:Int
    var body: some View {
        Image( systemName:TempImage).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width:180,height: 180)
        Text("\(TempCount)°C").font(.system(size: 70 ,weight: .medium)).foregroundColor(.white)
       
    }
}


