//
//  AppRootView.swift
//  AppRootVCSwiftUISample
//
//  Created by Eisuke Sato on 2025/11/21.
//

import SwiftUI
import Observation

enum AppRootScreen {
    case splash
    case login
    case main
}

struct SwitchAppRootScreenAction {
    private var currentScreen: Binding<AppRootScreen>?
    
    init(currentScreen: Binding<AppRootScreen>?) {
        self.currentScreen = currentScreen
    }
    
    func callAsFunction(to screen: AppRootScreen) {
        guard let currentScreen else {
            assertionFailure("SwitchAppRootScreenActionでcurrentScreenが設定されていません。")
            return
        }
        currentScreen.wrappedValue = screen
    }
    
    private func assertionFailure(_ message: String) {
        // Preview中にassertionFailureが呼ばれるとPreviewがクラッシュしてしまうのでその対処。
        if ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] == "1" {
            print(message)
        } else {
            Swift.assertionFailure(message)
        }
    }
}

extension EnvironmentValues {
    @Entry var switchAppRootScreen: SwitchAppRootScreenAction = .init(currentScreen: nil)
}

struct AppRootView: View {
    @State private var currentScreen: AppRootScreen = .splash
    
    var body: some View {
        ZStack {
            switch currentScreen {
            case .splash:
                SplashView()
                    .transition(.opacity)
            case .login:
                LoginView()
                    .transition(.opacity)
            case .main:
                MainView()
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut(duration: 0.3), value: currentScreen)
        .environment(\.switchAppRootScreen, .init(currentScreen: $currentScreen))
    }
}

#Preview {
    AppRootView()
}
