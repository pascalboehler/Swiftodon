public enum Visibility: String, Codable {
    /// Post is public to all instances
    case `public` = "public"
    
    /// Post is public for the instance the user is on
    case community = "community"
    
    /// Post is only visible to own followers
    case `private` = "private"
}
