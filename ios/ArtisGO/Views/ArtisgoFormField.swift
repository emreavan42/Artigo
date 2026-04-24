import SwiftUI

struct ArtisgoFormField<Content: View>: View {
    let label: String
    var required: Bool = true
    var error: String? = nil
    @ViewBuilder var content: () -> Content

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 2) {
                Text(label)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.secondary)
                if required {
                    Text("*")
                        .foregroundStyle(.red)
                        .font(.system(size: 14, weight: .bold))
                }
            }
            content()
            if let error, !error.isEmpty {
                Text(error)
                    .font(.system(size: 12))
                    .foregroundStyle(.red)
            }
        }
    }
}

struct ArtisgoTextFieldStyle: ViewModifier {
    let isFocused: Bool
    var hasError: Bool = false

    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 16)
            .frame(height: 50)
            .background(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(
                        hasError ? Color.red : (isFocused ? ArtisgoTheme.orange : Color(.systemGray4)),
                        lineWidth: 1
                    )
            )
    }
}

extension View {
    func artisgoField(isFocused: Bool, hasError: Bool = false) -> some View {
        modifier(ArtisgoTextFieldStyle(isFocused: isFocused, hasError: hasError))
    }
}

struct CGUToggle: View {
    @Binding var isOn: Bool

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Button {
                isOn.toggle()
            } label: {
                Image(systemName: isOn ? "checkmark.square.fill" : "square")
                    .font(.system(size: 22))
                    .foregroundStyle(isOn ? ArtisgoTheme.orange : Color(.systemGray3))
            }
            .buttonStyle(.plain)

            (
                Text("J'accepte les ")
                    .foregroundStyle(.black)
                + Text("Conditions Générales d'Utilisation")
                    .foregroundStyle(ArtisgoTheme.orange)
                    .underline()
            )
            .font(.system(size: 14))
            .onTapGesture {
                // Prévu pour plus tard : ouvrir les CGU
            }
        }
    }
}

struct PrimaryOrangeButton: View {
    let title: String
    var isEnabled: Bool = true
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 18, weight: .bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(isEnabled ? ArtisgoTheme.orange : Color(.systemGray3), in: .rect(cornerRadius: 16))
        }
        .disabled(!isEnabled)
    }
}
