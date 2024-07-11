//
//  ContentView.swift
//  Shared
//
//  Created by Lucas C Barros on 2022-08-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            SceneBackgroundView()
            VStack(spacing: -50) {
                HStack {
                    Spacer()
                    MonsterButtonView()
                }
                HStack {
                    PlayerButtonView()
                    Spacer()
                }
            }
            VStack {
                VStack(spacing: -12) {
                    TopBattleBarView()
                    ExpandTopMenuBar()
                }
                Spacer()
                VStack(spacing: -11) {
                    HStack(alignment: .bottom) {
                        LockScreenButtonView(isLocked: false)
                        Spacer()
                        ExpandBottomMenuBar()
                        Spacer()
                        StateMenuButtonView(isHidden: true)
                    }
                    BottomBattleBarView()
                }
            }
        }
        .background(Color.orange)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView().previewDevice("iPhone 8")
            
        ContentView().previewDevice("iPhone 11")
    }
}

struct LockScreenButtonView: View {
    @State var isLocked: Bool
    
    var body: some View {
        Button() {
            print("Screen is locked")
            isLocked.toggle()
        } label: {
            Image(isLocked ? "unlockButtons" : "lockButtons")
                .scaleEffect(0.5)
        }
    }
}
