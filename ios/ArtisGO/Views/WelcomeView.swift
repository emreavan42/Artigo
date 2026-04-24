import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                Spacer(minLength: 40)

                ArtisgoLogoView(size: 120)

                Text("artisGO")
                    .font(.system(size: 36, weight: .bold))
                    .foregroundStyle(.black)
                    .padding(.top, 16)

                Text("Votre artisan, à portée de clic")
                    .font(.system(size: 16))
                    .foregroundStyle(.secondary)
                    .padding(.top, 6)

                Spacer()

                VStack(spacing: 16) {
                    NavigationLink {
                        InscriptionParticulierView()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "house.fill")
                            Text("Je suis particulier")
                        }
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(ArtisgoTheme.orange, in: .rect(cornerRadius: 16))
                    }

                    NavigationLink {
                        InscriptionArtisanEtape1View()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "hammer.fill")
                            Text("Je suis artisan")
                        }
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(ArtisgoTheme.darkBlue, in: .rect(cornerRadius: 16))
                    }
                }
                .padding(.horizontal, 24)

                Spacer()

                HStack(spacing: 4) {
                    Text("Déjà un compte ?")
                        .foregroundStyle(.secondary)
                    NavigationLink("Se connecter") {
                        ConnexionView()
                    }
                    .foregroundStyle(ArtisgoTheme.orange)
                    .fontWeight(.semibold)
                }
                .font(.system(size: 15))
                .padding(.bottom, 24)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
        }
    }
}

#Preview {
    WelcomeView()
}
