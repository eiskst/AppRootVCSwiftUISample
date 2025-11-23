//
//  MainView.swift
//  AppRootVCSwiftUISample
//
//  Created by Eisuke Sato on 2025/11/21.
//

import SwiftUI

struct MainView: View {
    @Environment(\.switchAppRootScreen) var switchAppRootScreen
    @State var isLoading: Bool = false
    
    var body: some View {
        TabView {
            Tab("Tab 1", systemImage: "1.square") {
                Text("Tab 1")
                    .font(.largeTitle)
                    .bold()
            }
            
            Tab("Tab 2", systemImage: "2.square") {
                Text("Tab 2")
                    .font(.largeTitle)
                    .bold()
            }
            
            Tab("Tab 3", systemImage: "3.square") {
                VStack {
                    Text("Tab 3")
                        .font(.largeTitle)
                        .bold()
                    
                    Button {
                        Task {
                            await logout()
                        }
                    } label: {
                        if isLoading {
                            ProgressView()
                                .tint(.gray)
                        } else {
                            Text("Logout")
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.red)
                    .disabled(isLoading)
                }
            }
        }
    }
    
    private func logout() async {
        isLoading = true
        // 実際はここで認証情報を破棄する
        try? await Task.sleep(for: .seconds(2))
        
        switchAppRootScreen(to: .login)
    }
}

#Preview {
    MainView()
}
