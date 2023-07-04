import Foundation
import Usecase

extension BearerAuth {
    public init() {
        self.init(user: .init(), token: .init())
    }
}

extension BearerAuth.Token {
    public init() {
        self.init(UUID().uuidString)
    }
}
