//
//  ContentView.swift
//  Shared
//
//  Created by 小笠原佑樹 on 2022/07/11.
//

import SwiftUI

struct ContentView: View {
    @State var timerHandler: Timer?
    @State var count = 0

    @AppStorage("timer_value") var timerValue = 0

    var body: some View {
        NavigationView {
            ZStack {
                Image("backgroundTimer")
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)

                VStack (spacing: 30.0){
                    Text("残り\(timerValue - count)秒")
                        .font(.largeTitle)
                    
                    HStack {
                        Button(action: {
                            startTimer()
                        }) {
                            ButtonView(text: "スタート", backGroundColorName: "startColor")
                        }

                        Button(action: {
                            if let unwrapedTimerHandler = timerHandler {
                                if unwrapedTimerHandler.isValid == true {
                                    unwrapedTimerHandler.invalidate()
                                }
                            }
                        }) {
                            ButtonView(text: "ストップ", backGroundColorName: "stopColor")
                        }
                    }
                }
            }
            .onAppear {
                count = 0
            }
            .navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
                Text("秒数設定")
            })
        }
    }

    func countDownTimer() {
        count += 1
        if timerValue - count <= 0 {
            timerHandler?.invalidate()
        }
    }

    func startTimer() {
        // タイマーが実行中なら何もしない
        if let unwrapedTimerHandler = timerHandler {
            if unwrapedTimerHandler.isValid == true {
                return
            }
        }

        if timerValue - count <= 0 {
            count = 0
        }

        timerHandler = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {
            _ in countDownTimer()
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
