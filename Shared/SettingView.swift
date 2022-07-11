//
//  SettingView.swift
//  Timer
//
//  Created by 小笠原佑樹 on 2022/07/11.
//

import SwiftUI

struct SettingView: View {
    @State var timerValue = 10;

    var body: some View {
        ZStack {
            Color("backgroundColor")
                .edgesIgnoringSafeArea(.all)

            VStack {
                Spacer()
                
                Text("\(timerValue) 秒")
                    .font(.largeTitle)

                Spacer()

                Picker(selection: $timerValue, label: Text("選択")) {
                    Text("10秒").tag(10)
                    Text("20秒").tag(20)
                    Text("30秒").tag(30)
                    Text("40秒").tag(40)
                    Text("50秒").tag(50)
                    Text("60秒").tag(60)
                }

                Spacer()
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
