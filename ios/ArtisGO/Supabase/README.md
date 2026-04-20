# Supabase — Backend d'artisGO

Ce dossier contient tout le code lié à l'intégration Supabase.

## Structure

- `SupabaseConfig.swift` : Configuration (URL, clés)
- `SupabaseClient.swift` : Client singleton
- `Models/` : Modèles Swift qui correspondent aux tables Supabase

## À faire avant utilisation

1. Installer la librairie `supabase-swift` via Swift Package Manager dans Xcode
   URL : https://github.com/supabase/supabase-swift
2. Configurer les vraies clés Supabase (via variables d'environnement)
3. Remplir le code placeholder dans SupabaseClient.swift

## Tables Supabase correspondantes

- profiles → Profile.swift
- artisan_profiles → ArtisanProfile.swift
- chantiers → ChantierDB.swift
- (autres modèles à ajouter : conversation, message, review, document)

## Note sur le nommage

Le modèle `ChantierDB.swift` est nommé ainsi pour éviter un conflit de compilation
avec le struct `Chantier` existant dans `ios/ArtisGO/Models/Chantier.swift`.
Ces deux modèles seront fusionnés lors de la migration complète vers Supabase.
