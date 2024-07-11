//
//  BottomBattleBarView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-27.
//

import SwiftUI

struct BottomBattleBarView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 130)
                .background(.cyan)
                .opacity(0.4)
            
            HStack {
                Spacer()
                
                VStack(spacing: 5) {
                    Spacer()
                    HStack {
                        Text("Knight")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HealthBarView()
                    
                    HStack {
                        HStack {
                            ForEach(0..<4) { _ in
                                SkillLevelPinView()
                            }
                        }.padding()
                    }
                }
                AvatarLevelPinView()
                Spacer()
            }
            .frame(height: 130)
            .background(.clear)
        }
    }
}

struct BottomBattleBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBattleBarView()
    }
}

// TODO: Separate views
struct AvatarLevelPinView: View {
    var body: some View {
        Button() {
            print("Clicked Avatar")
        } label: {
            VStack {
                Spacer()
                CircleImage(imageName: "dragon")
                ZStack {
                    Capsule()
                        .fill(.red)
                        .frame(width: 75, height: 30)
                        .overlay(
                            Capsule()
                                .stroke(.white)
                        )
                    Text("Lv 10")
                        .bold()
                }.offset(y: -15)
            }
        }
    }
}

struct SkillLevelPinView: View {
    var body: some View {
        ZStack {
            Capsule()
                .fill(.black)
                .frame(width: 50, height: 30)
                .overlay(
                    Capsule()
                        .stroke(.white)
                )
            Text("10")
                .font(.title2)
                .bold()
                .foregroundColor(.white)
            
            Image("heart")
                .scaleEffect(0.7)
                .offset(y: -20)
        }
    }
}
