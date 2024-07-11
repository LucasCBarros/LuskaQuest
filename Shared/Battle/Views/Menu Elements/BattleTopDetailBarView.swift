//
//  BattleTopDetailBarView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-27.
//

import SwiftUI

struct BattleTopDetailBarView: View {
    var body: some View {
        HStack {
            Spacer()
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
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Text("Dragon")
                        .bold()
                        .font(.title)
                    Spacer()
                    
                    Button() {
                        print("Close menu")
                    } label: {
                        Text("X")
                            .font(.title)
                            .bold()
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 15))
                                .foregroundColor(.red)
                                
                    }
                }
                Spacer()
                HStack {
                    Spacer()
                    VStack{
                        Text("Str: 342")
                        Text("Atk: 234")
                        Text("Def: 223")
                    }
                    Spacer()
                    VStack{
                        Text("Str: 342")
                        Text("Atk: 234")
                        Text("Def: 223")
                    }
                    Spacer()
                    VStack{
                        Text("Str: 342")
                        Text("Atk: 234")
                        Text("Def: 223")
                    }
                    Spacer()
                }.font(.footnote)
                Spacer()
            }
        }
        .frame(height: 120)
        .background(Color.brown)
    }
}

struct BattleTopDetailBarView_Previews: PreviewProvider {
    static var previews: some View {
        BattleTopDetailBarView()
    }
}
