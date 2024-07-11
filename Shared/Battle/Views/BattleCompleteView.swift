//
//  BattleCompleteView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-28.
//

import SwiftUI

struct BattleCompleteView: View {
    var body: some View {
        ZStack {
            SceneBackgroundView()
            VStack(spacing: -10) {
                Spacer()
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
                VStack(spacing: -10) {
                    TopBattleBarView()
                    ExpandTopMenuBar()
                }
                Spacer()
                HStack {
                    VStack(spacing: 0) {
                        HStack {
                            Spacer()
                            StateMenuButtonView(isHidden: true)
                        }
                        HStack {
                            Spacer()
                            HStack {
                                ExpandLeftMenuButtonView()
                                Spacer()
//                                BeserkerModeButtonView()
                                Spacer()
                                ExpandRightMenuButtonView()
                            }
                        }
                    }
                }
            }
        }
        .background(Color.orange)
    }
}

struct BattleCompleteView_Previews: PreviewProvider {
    static var previews: some View {
        BattleCompleteView()
    }
}

struct BeserkerModeButtonView: View {
    @State var enabled = false
    @State private var progress = 0.0
        let timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
    
    var body: some View {
        Button() {
            print("Screen is locked")
            enabled.toggle()
        } label: {
            ZStack {
                Image("BeserkerModeButton")
                    .scaleEffect(0.15)
                    .opacity(enabled ? 0.5 : 1)
                
                if enabled {
                ProgressView("Loading...", value: progress, total: 100)
                    .progressViewStyle(CustomCircularProgressViewStyle())
                    .onReceive(timer) { _ in
                                    if progress < 100 {
                                        progress += 2
                                    } else {
                                        enabled = false
                                        progress = 0
                                    }
                                }
                }
                
            }
        }.frame(width: 60, height: 60)
    }
}

struct CustomCircularProgressViewStyle: ProgressViewStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: CGFloat(configuration.fractionCompleted ?? 0))
                .stroke(Color.orange, style: StrokeStyle(lineWidth: 10, dash: [10, 0]))
                .rotationEffect(.degrees(90))
                .frame(width: 40)
            
//            if let fractionCompleted = configuration.fractionCompleted {
//                Text(fractionCompleted < 1 ?
//                     "Completed \(Int((configuration.fractionCompleted ?? 0) * 100))%"
//                     : "Done!"
//                )
//                .fontWeight(.bold)
//                .foregroundColor(fractionCompleted < 1 ? .orange : .green)
//                .frame(width: 20)
//            }
        }.background(.clear)
    }
}

