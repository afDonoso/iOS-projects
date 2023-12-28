//
//  ContentView.swift
//  SlotMachine
//
//  Created by Andres Donoso on 28/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
    let haptics = UINotificationFeedbackGenerator()
    
    @State private var showingInfoView = false
    @State private var reels = [0, 1, 2]
    @State private var highscore: Int = UserDefaults.standard.integer(forKey: "HighScore")
    @State private var coins: Int = 100
    @State private var betAmount: Int = 10
    @State private var isActiveBet10 = true
    @State private var showingModal = false
    @State private var animatingSymbol = false
    @State private var animatingModal = false
    
    //MARK: - FUNCTIONS
    
    func spinReels() {
        //        reels[0] = Int.random(in: 0...symbols.count - 1)
        //        reels[1] = Int.random(in: 0...symbols.count - 1)
        //        reels[2] = Int.random(in: 0...symbols.count - 1)
        
        reels = reels.map({ _ in
                .random(in: 0..<symbols.count)
        })
        playSound(sound: "spin", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    func checkWinning() {
        if reels[0] == reels[1] && reels[1] == reels[2] {
            // PLAYER WINS
            playerWins()
            
            // NEW HIGHSCORE
            if coins > highscore {
                newHighscore()
            } else {
                playSound(sound: "win", type: "mp3")
            }
        } else {
            // PLAYER LOOSES
            playerLooses()
        }
    }
    
    func playerWins() {
        coins += betAmount * 10
    }
    
    func newHighscore() {
        highscore = coins
        UserDefaults.standard.set(highscore, forKey: "HighScore")
        playSound(sound: "high-score", type: "mp3")
    }
    
    func playerLooses() {
        coins -= betAmount
    }
    
    func activateBet20() {
        betAmount = 20
        isActiveBet10 = false
        playSound(sound: "casino-chips", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    func activateBet10() {
        betAmount = 10
        isActiveBet10 = true
        playSound(sound: "casino-chips", type: "mp3")
        haptics.notificationOccurred(.success)
    }
    
    func isGameOver() {
        if coins <= 0 {
            showingModal = true
            playSound(sound: "game-over", type: "mp3")
        }
    }
    
    func resetGame() {
        UserDefaults.standard.set(0, forKey: "HighScore")
        highscore = 0
        coins = 100
        activateBet10()
        playSound(sound: "chimeup", type: "mp3")
    }
    
    //MARK: - BODY
    var body: some View {
        ZStack {
            //MARK: - BACKGROUND
            LinearGradient(colors: [.colorPink, .colorPurple], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            //MARK: - INTERFACE
            VStack(spacing: 5) {
                //MARK: - HEADER
                LogoView()
                
                Spacer()
                
                //MARK: - SCORE
                HStack {
                    HStack {
                        Text("Your\nCoins".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.trailing)
                        
                        Text("\(coins)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                    } //: HStack
                    .modifier(ScoreContainerModifier())
                    
                    Spacer()
                    
                    HStack {
                        Text("\(highscore)")
                            .scoreNumberStyle()
                            .modifier(ScoreNumberModifier())
                        
                        Text("High\nScore".uppercased())
                            .scoreLabelStyle()
                            .multilineTextAlignment(.leading)
                    } //: HStack
                    .modifier(ScoreContainerModifier())
                } //: HStack
                
                //MARK: - SLOT MACHINE
                VStack(spacing: 0) {
                    //MARK: - REEL 1
                    ZStack {
                        ReelView()
                        
                        Image(symbols[reels[0]])
                            .resizable()
                            .modifier(ImageModifier())
                            .opacity(animatingSymbol ? 1 : 0)
                            .offset(y: animatingSymbol ? 0 : -50)
                            .animation(.easeOut(duration: .random(in: 0.5...0.7)))
                            .onAppear {
                                animatingSymbol.toggle()
                                    playSound(sound: "riseup", type: "mp3")
                            }
                    }
                    
                    HStack(spacing: 0) {
                        //MARK: - REEL 2
                        ZStack {
                            ReelView()
                            
                            Image(symbols[reels[1]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: .random(in: 0.7...0.9)))
                                .onAppear {
                                    animatingSymbol.toggle()
                                }
                        }
                        
                        Spacer()
                        
                        //MARK: - REEL 3
                        ZStack {
                            ReelView()
                            
                            Image(symbols[reels[2]])
                                .resizable()
                                .modifier(ImageModifier())
                                .opacity(animatingSymbol ? 1 : 0)
                                .offset(y: animatingSymbol ? 0 : -50)
                                .animation(.easeOut(duration: .random(in: 0.9...1.1)))
                                .onAppear {
                                    animatingSymbol.toggle()
                                }
                        }
                    } //: ZStack
                    .frame(maxWidth: 500)
                    
                    //MARK: - SPIN BUTTON
                    Button(action: {
                        withAnimation {
                            animatingSymbol = false
                        }
                        
                        spinReels()
                        
                        withAnimation {
                            animatingSymbol = true
                        }
                        
                        checkWinning()
                        isGameOver()
                    }, label: {
                        Image(.gfxSpin)
                            .renderingMode(.original)
                            .resizable()
                            .modifier(ImageModifier())
                    })
                } //: Slot Machine
                .layoutPriority(2)
                
                //MARK: - FOOTER
                Spacer()
                
                HStack {
                    //MARK: - BET 20
                    HStack(spacing: 10) {
                        Button(action: {
                            activateBet20()
                        }, label: {
                            Text("20")
                                .fontWeight(.heavy)
                                .foregroundStyle(isActiveBet10 ? .white : .yellow)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                        
                        Image(.gfxCasinoChips)
                            .resizable()
                            .offset(x: isActiveBet10 ? 20 : 0)
                            .opacity(isActiveBet10 ? 0 : 1)
                            .modifier(CasinoChipsModifier())
                    } //: HStack
                    
                    Spacer()
                    
                    //MARK: - BET 10
                    HStack(spacing: 10) {
                        Image(.gfxCasinoChips)
                            .resizable()
                            .offset(x: isActiveBet10 ? 0 : -20)
                            .opacity(isActiveBet10 ? 1 : 0)
                            .modifier(CasinoChipsModifier())
                        
                        Button(action: {
                            activateBet10()
                        }, label: {
                            Text("10")
                                .fontWeight(.heavy)
                                .foregroundStyle(isActiveBet10 ? .yellow : .white)
                                .modifier(BetNumberModifier())
                        })
                        .modifier(BetCapsuleModifier())
                    } //: HStack
                } //: HStack
            } //: VStack
            //MARK: - BUTTONS
            .overlay(alignment: .topLeading) {
                // RESET
                Button(action: {
                    resetGame()
                }, label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                })
                .modifier(ButtonModifier())
            }
            .overlay(alignment: .topTrailing) {
                // INFO
                Button(action: {
                    showingInfoView = true
                }, label: {
                    Image(systemName: "info.circle")
                })
                .modifier(ButtonModifier())
            }
            .padding()
            .frame(maxWidth: 720)
            .blur(radius: $showingModal.wrappedValue ? 5 : 0)
            
            //MARK: - POPUP
            if showingModal {
                ZStack {
                    Color.colorTransparentBlack
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        // TITLE
                        Text("GAME OVER")
                            .font(.system(.title, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(.colorPink)
                            .foregroundStyle(.white)
                        
                        Spacer()
                        
                        // MESSAGE
                        VStack(spacing: 16) {
                            Image(.gfxSevenReel)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 72)
                            
                            Text("Bad luck! You lost all of the coins. \nLet's play again!")
                                .font(.system(.body, design: .rounded))
                                .lineLimit(2)
                                .multilineTextAlignment(.center)
                                .foregroundStyle(.gray)
                                .layoutPriority(1)
                            
                            Button(action: {
                                showingModal = false
                                animatingModal = false
                                activateBet10()
                                coins = 100
                            }, label: {
                                Text("New Game".uppercased())
                                    .font(.system(.body, design: .rounded))
                                    .fontWeight(.semibold)
                                    .tint(.colorPink)
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 8)
                                    .frame(minWidth: 128)
                                    .background(
                                        Capsule()
                                            .strokeBorder(lineWidth: 1.75)
                                            .foregroundStyle(.colorPink)
                                    )
                            })
                        } //: VStack
                        
                        Spacer()
                    } // VStack
                    .frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320)
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 20))
                    .shadow(color: .colorTransparentBlack, radius: 6, y: 8)
                    .opacity(animatingModal ? 1 : 0)
                    .offset(y: animatingModal ? 0 : -100)
                    .onAppear {
                        withAnimation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0)) {
                            animatingModal = true
                        }
                    }
                }
            }
        } //: ZStack
        .sheet(isPresented: $showingInfoView, content: {
            InfoView()
        })
    }
}

#Preview {
    ContentView()
}
