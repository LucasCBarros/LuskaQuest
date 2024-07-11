//
//  PlayerButtonView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct PlayerButtonView: View {
    var body: some View {
        Button() {
            print("Player Clicked")
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(.green)
                    .opacity(0.3)
                    .frame(width: 300, height: 300)
                
                Image("playerMock")
                    .scaleEffect(0.6)
                    .aspectRatio(contentMode: .fill)
            }.frame(width: 300, height: 300)
                .offset(x: -50)
        }
    }
}

struct PlayerButtonView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerButtonView()
    }
}
