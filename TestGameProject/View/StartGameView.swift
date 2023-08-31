//
//  StartGameView.swift
//  TestGameProject
//
//  Created by Дарья Пивовар on 28.08.2023.
//

import SwiftUI

struct StartGameView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                if model.game.isGameStarted {
                    AimView(geo: geo)
                } else {
                    VStack {
                        Spacer()
                        
                        Text("GAME")
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                            .padding()
                        
                        
                        HStack {
                            Spacer()
                            Button(action: {
                                model.game.isGameStarted = true
                                startTimer()
                            }) {
                                Text("Start")
                                    .padding()
                                    .foregroundColor(.white)
                            }
                            .background(Color.green)
                            .cornerRadius(5)
                            .padding()
                            Spacer()
                        }
                        
                        Spacer()
                    }
                }
                
                NavigationLink(destination:  WebViewContainer(model: model)
                                .navigationBarTitle(Text(model.game.title), displayMode: .inline)
                                .navigationBarItems(leading: Button(action: {
                                    model.game.shouldGoBack.toggle()
                                }, label: {
                                    if model.game.canGoBack {
                                        Image(systemName: "arrow.left")
                                            .frame(width: 44, height: 44, alignment: .center)
                                    } else {
                                        EmptyView()
                                            .frame(width: 0, height: 0, alignment: .center)
                                    }
                                })
                                ), isActive: $model.game.isShowingWebView) { EmptyView() }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: $model.game.isShowingOnboarding) {
                OnboardingView()
            }
            .onAppear(perform: {
                if !UserDefaults.standard.bool(forKey: "didLaunchBefore") {
                    UserDefaults.standard.set(true, forKey: "didLaunchBefore")
                    model.game.isShowingOnboarding = true
                }
            })
        }.navigationBarBackButtonHidden(true)
    }
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            model.game.timerCount += 1

            if model.game.timerCount >= 7 {
                timer.invalidate()
            }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartGameView()
    }
}
