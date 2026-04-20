import Foundation

/// Modèle correspondant à la table "chantiers" dans Supabase
/// Nommé ChantierDB pour éviter le conflit avec le struct Chantier existant
/// dans ios/ArtisGO/Models/Chantier.swift (modèle UI local).
/// Les deux seront fusionnés quand on migrera complètement vers Supabase.
struct ChantierDB: Codable, Identifiable {
    let id: UUID
    let userId: UUID
    let categorie: String
    let titre: String
    let description: String?
    let budgetMin: Int?
    let budgetMax: Int?
    let adresse: String?
    let urgent: Bool
    let status: String  // "ouvert", "en_cours", "termine", "annule"
    let createdAt: Date

    enum CodingKeys: String, CodingKey {
        case id
        case userId = "user_id"
        case categorie
        case titre
        case description
        case budgetMin = "budget_min"
        case budgetMax = "budget_max"
        case adresse
        case urgent
        case status
        case createdAt = "created_at"
    }
}
