//
//  LoginView.swift
//  AppRootVCSwiftUISample
//
//  Created by Eisuke Sato on 2025/11/21.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.switchAppRootScreen) var switchAppRootScreen
    @State var isLoading: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Login")
                .font(.largeTitle)
                .bold()
            
            Button {
                Task {
                    await login()
                }
            } label: {
                if isLoading {
                    ProgressView()
                        .tint(.gray)
                } else {
                    Text("Login")
                }
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .disabled(isLoading)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
    
    private func login() async {
        isLoading = true
        // 実際はここで認証APIを呼び出す
        try? await Task.sleep(for: .seconds(2))
        
        switchAppRootScreen(to: .main)
    }
}

#Preview {
    LoginView()
}
