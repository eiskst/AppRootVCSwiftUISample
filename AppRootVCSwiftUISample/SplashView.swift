//
//  SplashView.swift
//  AppRootVCSwiftUISample
//
//  Created by Eisuke Sato on 2025/11/21.
//

import SwiftUI

struct SplashView: View {
    @Environment(\.switchAppRootScreen) var switchAppRootScreen
    var body: some View {
        VStack {
            Text("Splash")
                .font(.largeTitle)
                .bold()
            
            ProgressView()
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .task {
            await initialize()
        }
    }
    
    private func initialize() async {
        let isLoggedIn = try? await checkLoginStatus()
        
        if isLoggedIn == true {
            switchAppRootScreen(to: .main)
        } else {
            switchAppRootScreen(to: .login)
        }
    }
    
    private func checkLoginStatus() async throws -> Bool {
        // 実際はここで認証情報を確認する
        try await Task.sleep(for: .seconds(2))
        
        return false
    }
}

#Preview {
    SplashView()
}
