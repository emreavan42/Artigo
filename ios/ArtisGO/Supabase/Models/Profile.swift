import Foundation

/// Modèle correspondant à la table "profiles" dans Supabase
/// Un profil peut être un particulier ou un artisan
struct Profile: Codable, Identifiable {
    let id: UUID
    let role: String  // "particulier" ou "artisan"
    let fullName: String?
    let avatarURL: String?
    let phone: String?
    let city: String?
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case role
        case fullName = "full_name"
        case avatarURL = "avatar_url"
        case phone
        case city
        case createdAt = "created_at"
    }
}
