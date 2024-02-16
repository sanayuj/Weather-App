//
//  WeatherButton.swift
//  Weather-App
//
//  Created by Sanay UJ on 16/02/24.
//


//Btn Label

import SwiftUI


struct BtnLabel:View {
    var btnText:String
    var textColor:Color
    var backgroundColor:Color
    
    var body: some View {
        Text(btnText).font(.system(size: 20,weight: .bold)).foregroundColor(textColor).frame(width: 350,height: 50).background(Color(backgroundColor)).cornerRadius(10)
    }
}


