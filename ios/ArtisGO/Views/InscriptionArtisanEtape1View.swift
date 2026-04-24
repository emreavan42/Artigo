import SwiftUI

struct ArtisanInscriptionData {
    var prenom: String = ""
    var nom: String = ""
    var email: String = ""
    var telephone: String = ""
    var motDePasse: String = ""
}

struct InscriptionArtisanEtape1View: View {
    @State private var data = ArtisanInscriptionData()

    @State private var emailError: String = ""
    @State private var telError: String = ""
    @State private var mdpError: String = ""

    @FocusState private var focus: Field?
    enum Field { case prenom, nom, email, tel, mdp }

    private var isValid: Bool {
        !data.prenom.isEmpty && !data.nom.isEmpty &&
        isValidEmail(data.email) && isValidPhone(data.telephone) &&
        data.motDePasse.count >= 8
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Créez votre compte artisan")
                        .font(.system(size: 26, weight: .bold))
                        .foregroundStyle(.black)
                    Text("Étape 1 sur 2 — Vos informations")
                        .font(.system(size: 15))
                        .foregroundStyle(.secondary)

                    HStack(spacing: 8) {
                        RoundedRectangle(cornerRadius: 3)
                            .fill(ArtisgoTheme.orange)
                            .frame(height: 6)
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color(.systemGray4))
                            .frame(height: 6)
                    }
                    .padding(.top, 4)
                }
                .padding(.top, 8)

                ArtisgoFormField(label: "Prénom") {
                    TextField("", text: $data.prenom)
                        .focused($focus, equals: .prenom)
                        .artisgoField(isFocused: focus == .prenom)
                }

                ArtisgoFormField(label: "Nom") {
                    TextField("", text: $data.nom)
                        .focused($focus, equals: .nom)
                        .artisgoField(isFocused: focus == .nom)
                }

                ArtisgoFormField(label: "Email", error: emailError) {
                    TextField("", text: $data.email)
                        .focused($focus, equals: .email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocorrectionDisabled()
                        .artisgoField(isFocused: focus == .email, hasError: !emailError.isEmpty)
                }
                .onChange(of: focus) { old, _ in
                    if old == .email {
                        emailError = (data.email.isEmpty || isValidEmail(data.email)) ? "" : "Email invalide"
                    }
                }

                ArtisgoFormField(label: "Téléphone", error: telError) {
                    TextField("", text: $data.telephone)
                        .focused($focus, equals: .tel)
                        .keyboardType(.phonePad)
                        .artisgoField(isFocused: focus == .tel, hasError: !telError.isEmpty)
                }
                .onChange(of: focus) { old, _ in
                    if old == .tel {
                        telError = (data.telephone.isEmpty || isValidPhone(data.telephone)) ? "" : "Téléphone invalide (10 chiffres)"
                    }
                }

                ArtisgoFormField(label: "Mot de passe", error: mdpError) {
                    SecureField("", text: $data.motDePasse)
                        .focused($focus, equals: .mdp)
                        .artisgoField(isFocused: focus == .mdp, hasError: !mdpError.isEmpty)
                }
                .onChange(of: focus) { old, _ in
                    if old == .mdp {
                        mdpError = (data.motDePasse.isEmpty || data.motDePasse.count >= 8) ? "" : "Minimum 8 caractères"
                    }
                }

                NavigationLink {
                    InscriptionArtisanEtape2View(etape1Data: data)
                } label: {
                    Text("Continuer")
                        .font(.system(size: 18, weight: .bold))
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(isValid ? ArtisgoTheme.orange : Color(.systemGray3), in: .rect(cornerRadius: 16))
                }
                .disabled(!isValid)
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
    NavigationStack { InscriptionArtisanEtape1View() }
}
