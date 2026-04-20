import Foundation

/// Modèle correspondant à la table "artisan_profiles" dans Supabase
struct ArtisanProfile: Codable {
    let profileId: UUID
    let metier: String  // métier principal
    let metiersSecondaires: [String]  // max 3 métiers secondaires
    let description: String?
    let rayonActionKm: Int
    let disponibleAujourdhui: Bool
    let noteMoyenne: Double
    let nombreAvis: Int

    enum CodingKeys: String, CodingKey {
        case profileId = "profile_id"
        case metier
        case metiersSecondaires = "metiers_secondaires"
        case description
        case rayonActionKm = "rayon_action_km"
        case disponibleAujourdhui = "disponible_aujourdhui"
        case noteMoyenne = "note_moyenne"
        case nombreAvis = "nombre_avis"
    }
}
