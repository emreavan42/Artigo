import SwiftUI

@main
struct ArtisGOApp: App {
    @State private var appViewModel = AppViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appViewModel)
                .tint(ArtisgoTheme.orange)
        }
    }
}
