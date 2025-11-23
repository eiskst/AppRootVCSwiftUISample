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
    private var currentScreen: Binding<AppRootScreen>
    
    init(currentScreen: Binding<AppRootScreen>) {
        self.currentScreen = currentScreen
    }
    
    func callAsFunction(to screen: AppRootScreen) {
        currentScreen.wrappedValue = screen
    }
}

extension EnvironmentValues {
    @Entry var switchAppRootScreen: SwitchAppRootScreenAction = .init(currentScreen: .constant(.splash))
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
