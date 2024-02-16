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
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing).ignoresSafeArea()
            VStack{
                Text("Malappuram,Kerala").font(.system(size:32,weight: .medium)).foregroundColor(.white)
                    .padding()
                Image(systemName: "cloud.sun.fill").renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width:180,height: 180)
                
                Text("28°C").font(.system(size: 70 ,weight: .medium)).foregroundColor(.white)
                
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
                    Text("Change Day Time").font(.system(size: 20,weight: .bold)).foregroundColor(.blue).frame(width: 350,height: 50).background(Color("lightBlue")).cornerRadius(10)
                }
                
               
                
               
            }}
    }
}

#Preview {
    ContentView()
}

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
