import SwiftUI

@main
struct ArtisGOApp: App {
    @State private var appViewModel = AppViewModel()
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false

    var body: some Scene {
        WindowGroup {
            Group {
                if isLoggedIn {
                    ContentView()
                        .environment(appViewModel)
                } else {
                    WelcomeView()
                }
            }
            .tint(ArtisgoTheme.orange)
        }
    }
}
