public enum Visibility: String, Codable {
    /// Post is public to all instances and shown in public timeline
    case `public` = "public"
    
    /// Post is public, but not included in public timelines
    case unlisted = "unlisted"
    
    /// Post is only visible to own followers and any mentioned users
    case `private` = "private"
    
    /// Visible only to mentioned users
    case direct = "direct"
}
