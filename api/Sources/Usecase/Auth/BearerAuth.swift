import Foundation
import Entity

public struct BearerAuth: Hashable, Codable {
    
    public var user: User
    
    public var token: Token
    
    public init(user: User, token: Token) {
        self.user = user
        self.token = token
    }
}

extension BearerAuth {
    public struct Token: Hashable, Codable {
        
        public let value: String
        
        public init(_ value: String) {
            self.value = value
        }
    }
}
