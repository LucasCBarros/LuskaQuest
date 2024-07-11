//
//  TopBattleBarView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-27.
//

import SwiftUI

struct TopBattleBarView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 120)
                .background(.white)
                .opacity(0.4)
            HStack {
                Spacer()
                Button() {
                    print("Clicked Monster Avatar")
                } label: {
                    VStack {
                        Spacer()
                        CircleImage(imageName: "dragon")
                            .colorInvert()
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
                Spacer()
                VStack {
                    HStack {
                        Text("Dragon")
                            .bold()
                            .font(.title)
                            .foregroundColor(.white)
                    }
                    HealthBarView()
                    AttackSpeedView()
                }
                Spacer()
            }
            .frame(height: 120)
            .background(.clear)
        }
    }
}

struct TopBattleBarView_Previews: PreviewProvider {
    static var previews: some View {
        TopBattleBarView()
    }
}

// TODO: - Separar essas Views
struct CircleImage: View {
    var imageName: String
    
    var body: some View {
        Image(imageName)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 75, height: 75)
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

struct HealthBarView: View {
    var currentHealthPoint = 43
    var totalHealthPoint = 100
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(.red)
                .frame(width: CGFloat(totalHealthPoint)*2, height: 20)
                .overlay(
                    Capsule()
                        .stroke(.black)
                )
            HStack {
                Capsule()
                    .fill(.green)
                    .frame(width: CGFloat(currentHealthPoint)*2, height: 20)
                Spacer()
            }
            Text("\(currentHealthPoint)/\(totalHealthPoint)")
                .font(.subheadline)
                .foregroundColor(.white)
        }.frame(width: 200)
    }
}

struct AttackSpeedView: View {
    let barSize: CGFloat = 200
    let numberOfTurnToAttack = 10
    let numberOfTurnsPassed = 3
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(.gray)
                .frame(width: barSize, height: 20)
                .overlay(
                    Capsule()
                        .stroke(.black)
                )
            
            HStack(spacing: 0) {
                ForEach(0..<(numberOfTurnToAttack-numberOfTurnsPassed)) {_ in
                    Capsule()
                        .fill(.yellow)
                        .frame(width: barSize/CGFloat(numberOfTurnToAttack), height: 18)
                }
            }
            .frame(width: barSize, alignment: .leading)
            .fixedSize()
        }
    }
}
