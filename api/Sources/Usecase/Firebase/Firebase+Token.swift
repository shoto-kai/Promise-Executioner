extension Firebase {
    /// Firebaseの認証トークン
    public struct IDToken {
        
        public let value: String
        
        public init(_ value: String) {
            self.value = value
        }
    }
}
