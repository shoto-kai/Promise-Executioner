extension AppNotification {
    public enum Kind: String, Hashable, Codable, CaseIterable {
        case gift, penalty, sign
    }
}
