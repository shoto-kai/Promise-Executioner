extension Firebase {
    /// Firebaseの認証トークン
    public struct Token {
        
        public let value: String
        
        public init(_ value: String) {
            self.value = value
        }
    }
}
