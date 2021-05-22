//
//  ContentView.swift
//  MatchingGeometryEffectInSwiftUI
//
//  Created by ramil on 22.05.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MatchFrameExample().tabItem {
                Image(systemName: "1.circle.fill")
            }
            SwopView().tabItem {
                Image(systemName: "2.circle.fill")
            }
            AdaptiveView().tabItem {
                Image(systemName: "3.circle.fill")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
