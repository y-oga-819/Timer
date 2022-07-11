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
            VStack {
                Text("タイマー時間")
            }
            .navigationBarItems(trailing: NavigationLink(destination: SettingView()) {
                Text("秒数設定")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
