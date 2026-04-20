import Foundation

/// Configuration du client Supabase pour artisGO
/// ⚠️ Les vraies clés seront ajoutées quand la librairie supabase-swift sera installée via Xcode
/// Elles devront être stockées dans un fichier .xcconfig ou dans les Info.plist, jamais en dur dans le code

struct SupabaseConfig {
    // URL du projet Supabase (à configurer)
    static let supabaseURL = "PLACEHOLDER_SUPABASE_URL"

    // Clé publique anon (à configurer)
    static let supabaseAnonKey = "PLACEHOLDER_ANON_KEY"

    // À faire :
    // 1. Ajouter la librairie supabase-swift via Swift Package Manager dans Xcode
    // 2. Remplacer les placeholders par les vraies valeurs via variables d'environnement
    // 3. Créer le client dans SupabaseClient.swift
}
