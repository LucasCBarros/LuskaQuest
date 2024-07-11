//
//  MonsterButtonView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct MonsterButtonView: View {
    var body: some View {
        Button() {
            print("Monster Clicked")
        } label: {
            ZStack {
                Circle()
                    .foregroundColor(.purple)
                    .opacity(0.3)
                    .frame(width: 300, height: 300)
                
                Image("monsterMock")
                    .scaleEffect(0.7)
                    .aspectRatio(contentMode: .fill)
                    .offset(x: 30)
            }.frame(width: 300, height: 300)
                .offset(x: 75)
        }
    }
}

struct MonsterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MonsterButtonView()
    }
}
