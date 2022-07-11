//
//  ContentView.swift
//  Shared
//
//  Created by 小笠原佑樹 on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)

                VStack (spacing: 30.0){
                    Text("残り10秒")
                        .font(.largeTitle)
                    
                    HStack {
                        Button(action: {
                            
                        }) {
                            ButtonView(text: "スタート", backGroundColorName: "startColor")
                            ButtonView(text: "ストップ", backGroundColorName: "stopColor")
                        }
                    }
                }
            }
            .navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
                Text("秒数設定")
            })
        }
    }
}

struct ButtonView: View {
    let text: String
    let backGroundColorName: String

    var body: some View {
        Text(text)
            .font(.title)
            .foregroundColor(Color.white)
            .frame(width: 140, height: 140)
            .background(Color(backGroundColorName))
            .clipShape(Circle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
