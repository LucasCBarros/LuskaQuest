//
//  StateMenuButtonView.swift
//  LuskaQuest
//
//  Created by Lucas C Barros on 2022-08-27.
//

import SwiftUI

struct StateMenuButtonView: View {
    @State var isHidden: Bool
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Button("Button") {
                isHidden.toggle()
//            } label: {
//                ZStack {
////                    Circle()
////                        .foregroundColor(.cyan)
////                        .opacity(isShowing ? 0 : 0.5)
////                        .frame(width: 380)
////                    Circle()
////                        .foregroundColor(.blue)
////                        .opacity(0.5)
////                        .frame(width: isShowing ? 65 : 220)
//                    Circle()
//                        .foregroundColor(.cyan)
//                        .frame(width: 50)
//                    Text("Button")
//                        .foregroundColor(.black)
//                }
            }
            .background(Color(.red))
            .cornerRadius(15.0)
            .radialMenu(isShowing: $isHidden,
                        anchorPosition: .bottomRight,
                        distance: 75,
                        autoClose: false,
                        buttons: [
                            RadialMenuButton(color: .blue,
                                             image: "plus",
                                             size: 40,
                                             action: {
                                print("A")
                            }),
                            RadialMenuButton(color: .red,
                                             image: "minus",
                                             size: 40,
                                             action: {
                                print("B")
                            }),
                            RadialMenuButton(color: .green,
                                             image: "star",
                                             size: 40,
                                             action: {
                                print("C")
                            })
                        ])
            .radialMenu(isShowing: $isHidden,
                        anchorPosition: .bottomRight,
                        distance: 150,
                        autoClose: false,
                        buttons: [
                            RadialMenuButton(color: .blue,
                                             image: "plus",
                                             size: 50,
                                             action: {
                                print("AA")
                            }),
                            RadialMenuButton(color: .red,
                                             image: "minus",
                                             size: 50,
                                             action: {
                                print("BB")
                            }),
                            RadialMenuButton(color: .green,
                                             image: "star",
                                             size: 50,
                                             action: {
                                print("CC")
                            }),
                            RadialMenuButton(color: .yellow,
                                             image: "plus",
                                             size: 50,
                                             action: {
                                print("DD")
                            })
                        ])
            .background()
        }.offset(x: -5, y: -5)
    }
}

struct StateMenuButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StateMenuButtonView(isHidden: true)
            .previewDevice("iPhone 8")
    }
}

// The button data holder
struct RadialMenuButton {
    let color: Color
    let image: String
    let size: CGFloat
    let action: () -> Void
}

struct RadialMenu: ViewModifier {
    @Binding var isShowing: Bool
    let anchorPosition: AnchorPosition
    let distance: CGFloat
    let autoClose: Bool
    let buttons: [RadialMenuButton]
    
    func body(content: Content) -> some View {
        ZStack {
            content
            radialMenu
        }
    }
    
    // This might look complicated, but it just figures out the angle
    // between subsequent menu items. Since their spread can be on any
    // arc, it needs to do the check to prevent first and last item
    // from overlapping.
    private var angleDelta: Double {
        let span = anchorPosition.endAngle - anchorPosition.startAngle
        let n = buttons.count
        let nMinus1 = n - 1
        let candidate = span / Double(nMinus1)
        let point0 = pointFor(angleDelta: candidate, index: 0)
        let point1 = pointFor(angleDelta: candidate, index: 1)
        let pointN = pointFor(angleDelta: candidate, index: nMinus1)
        return (hypot(point0.x - point1.x, point0.y - point1.y) > hypot(point0.x - pointN.x, point0.y - pointN.y))
        ? span / Double(n)
        : candidate
    }
    
    // The offset from the anchor point for the button at the given index.
    private func pointFor(angleDelta: Double, index: Int) -> CGPoint {
        let angle = anchorPosition.startAngle + angleDelta * Double(index)
        return CGPoint(x: distance * cos(angle), y: distance * sin(angle))
    }
    
    @ViewBuilder private var radialMenu: some View {
        let angle = angleDelta
        ZStack {
            ForEach(0..<buttons.count) { i in
                radialMenuButton(buttons[i],
                                 offset: pointFor(angleDelta: angle, index: i))
            }
        }
    }
    
    private func radialMenuButton(_ button: RadialMenuButton,
                                  offset: CGPoint) -> some View {
        return Image(systemName: button.image)
            .imageScale(.large)
            .frame(width: button.size, height: button.size)
            .background(Circle().fill(button.color))
            .shadow(color: .gray, radius: 2, x: 1, y: 1)
            .onTapGesture {
                button.action()
                if autoClose {
                    isShowing.toggle()
                }
            }
            .offset(x: isShowing ? 0 : offset.x,
                    y: isShowing ? 0 : offset.y)
            .opacity(isShowing ? 0 : 1)
            .animation(.spring().speed(1))
        // in SwiftUI 3, use animation(.spring().speed(1), value: isShowing)
    }
    
    enum AnchorPosition {
        case topLeft,
             topRight,
             bottomLeft,
             bottomRight,
             center,
             custom(Angle, Angle)
        
        var startAngle: Double {
            switch self {
            case .topLeft:
                return 0
            case .topRight:
                return .pi / 2
            case .bottomLeft:
                return 3 * .pi / 2
            case .bottomRight:
                return .pi
            case .center:
                return -.pi / 2
            case .custom(let startAngle, _):
                return startAngle.radians
            }
        }
        
        var endAngle: Double {
            switch self {
            case .center:
                return 3 * .pi / 2
            case .custom(_, let endAngle):
                return endAngle.radians
            default:
                return startAngle + .pi / 2
            }
        }
    }
}

extension View {
    func radialMenu(isShowing: Binding<Bool>,
                    anchorPosition: RadialMenu.AnchorPosition,
                    distance: CGFloat,
                    autoClose: Bool,
                    buttons: [RadialMenuButton]) -> some View {
        self.modifier(RadialMenu(isShowing: isShowing,
                                 anchorPosition: anchorPosition,
                                 distance: distance,
                                 autoClose: autoClose,
                                 buttons: buttons))
    }
}
