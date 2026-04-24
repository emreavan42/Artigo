import SwiftUI

struct ConnexionView: View {
    @AppStorage("isLoggedIn") private var isLoggedIn: Bool = false
    @Environment(\.dismiss) private var dismiss

    @State private var email: String = ""
    @State private var motDePasse: String = ""

    @FocusState private var focus: Field?
    enum Field { case email, mdp }

    private var isValid: Bool {
        isValidEmail(email) && motDePasse.count >= 1
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Connexion")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundStyle(.black)
                    Text("Heureux de vous revoir")
                        .font(.system(size: 15))
                        .foregroundStyle(.secondary)
                }
                .padding(.top, 8)

                ArtisgoFormField(label: "Email") {
                    TextField("", text: $email)
                        .focused($focus, equals: .email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .artisgoField(isFocused: focus == .email)
                }

                ArtisgoFormField(label: "Mot de passe") {
                    SecureField("", text: $motDePasse)
                        .focused($focus, equals: .mdp)
                        .artisgoField(isFocused: focus == .mdp)
                }

                Button {
                    // Prévu pour plus tard
                } label: {
                    Text("Mot de passe oublié ?")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(ArtisgoTheme.orange)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)

                PrimaryOrangeButton(title: "Se connecter", isEnabled: isValid) {
                    print("Connexion: \(email)")
                    isLoggedIn = true
                }
                .padding(.top, 8)

                HStack(spacing: 4) {
                    Text("Pas encore de compte ?").foregroundStyle(.secondary)
                    Button("S'inscrire") {
                        dismiss()
                    }
                    .foregroundStyle(ArtisgoTheme.orange)
                    .fontWeight(.semibold)
                }
                .font(.system(size: 14))
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
            }
            .padding(.horizontal, 24)
            .padding(.bottom, 40)
        }
        .background(Color.white)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack { ConnexionView() }
}
