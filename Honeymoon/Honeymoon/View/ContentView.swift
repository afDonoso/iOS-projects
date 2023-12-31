//
//  ContentView.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @State private var showAlert = false
    @State private var showGuide = false
    @State private var showInfo = false
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    @GestureState private var dragState = DragState.inactive
    
    private var dragAreaThreshold: CGFloat = 65
    
    //MARK: - CARD VIEWS
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        
        return views
    }()
    
    //MARK: - MOVE THE CARD
    private func moverCards() {
        cardViews.removeFirst()
        
        lastCardIndex += 1
        
        let honeymoon = honeymoonData[lastCardIndex % honeymoonData.count]
        
        let newCardView = CardView(honeymoon: honeymoon)
        
        cardViews.append(newCardView)
    }
    
    //MARK: - TOP CARD
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        
        return index == 0
    }
    
    //MARK: - DRAG STATES
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
                case .inactive, .pressing:
                    return .zero
                    
                case .dragging(let translation):
                    return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
                case .dragging:
                    return true
                    
                case .pressing, .inactive:
                    return false
            }
        }
        
        var isPressing: Bool {
            switch self {
                case .dragging, .pressing:
                    return true
                    
                case .inactive:
                    return false
            }
        }
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            //MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            //MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay {
                            ZStack {
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width < -dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                                
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(dragState.translation.width > dragAreaThreshold && isTopCard(cardView: cardView) ? 1 : 0)
                            }
                        }
                        .offset(
                            x: isTopCard(cardView: cardView) ? dragState.translation.width : 0,
                            y: isTopCard(cardView: cardView) ? dragState.translation.height : 0
                        )
                        .scaleEffect(dragState.isDragging && isTopCard(cardView: cardView) ? 0.85 : 1)
                        .rotationEffect(
                            .degrees(isTopCard(cardView: cardView) ? Double(dragState.translation.width / 12) : 0)
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                        .gesture(
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating($dragState, body: { value, state, transaction in
                                    switch value {
                                        case .first(true):
                                            state = .pressing
                                            
                                        case .second(true, let drag):
                                            state = .dragging(translation: drag?.translation ?? .zero)
                                            
                                        default:
                                            break
                                    }
                                })
//                                .onChange { value in
//                                    guard case .second(true, let drag?) = value else {
//                                        return
//                                    }
//                                    
//                                    if drag.translation.width < -dragAreaThreshold {
//                                        cardRemovalTransition = .leadingBottom
//                                    }
//                                    
//                                    if drag.translation.width > dragAreaThreshold {
//                                        cardRemovalTransition = .trailingBottom
//                                    }
//                                }
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    if drag.translation.width < -dragAreaThreshold || drag.translation.width > dragAreaThreshold {
                                        playSound(sound: "sound-rise", type: "mp3")
                                        moverCards()
                                    }
                                })
                        )
                        .transition(cardRemovalTransition)
                } //: Loop
            } //: ZStack
            
            Spacer()
            
            //MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0 : 1)
                .animation(.default, value: dragState.isDragging)
        } //: VStack
        .alert("SUCCESS", isPresented: $showAlert) {
            Text("OK")
        } message: {
            Text("Wishing a lovely and most precious of the times together for the amazing couple.")
        }
        
    }
}

#Preview {
    ContentView()
}
