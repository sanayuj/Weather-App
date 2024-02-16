//
//  ContentView.swift
//  Weather-App
//
//  Created by Sanay UJ on 16/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundView(primaryColor: .blue, secondaryColor: Color("lightBlue"))
            VStack{
                
                CityName(cityName: "Malappuram,Kerala")
                
                MainCityTemperture(TempImage:"cloud.sun.fill", TempCount: 28)
               
                
                HStack{
                    WhetherDayView(weekName:"Mon",temperture:23,imageName:"cloud.sun.fill")
                    WhetherDayView(weekName:"Tue",temperture:32,imageName:"cloud.rain.fill")
                    WhetherDayView(weekName:"Wed",temperture:23,imageName:"wind")
                    WhetherDayView(weekName:"Thu",temperture:23,imageName:"cloud.sun.fill")
                    WhetherDayView(weekName:"Fri",temperture:23,imageName:"cloud.sun.bolt.fill")
                
               
                 
                }.padding(.top,30)
                Spacer()
                Button{
                    print("Clicked")
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
    
    var primaryColor:Color
    var secondaryColor:Color
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [primaryColor, secondaryColor]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
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


