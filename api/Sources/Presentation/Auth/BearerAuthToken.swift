import Vapor
import Usecase

public struct BearerAuthToken: Hashable, Content {
    
    public var token: String
    
    public init(_ token: String) {
        self.token = token
    }
    
}

extension BearerAuth.Token {
    public var toContent: BearerAuthToken {
        .init(value)
    }
}
