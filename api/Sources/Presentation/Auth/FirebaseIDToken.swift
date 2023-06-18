import Usecase
import Vapor

public struct FirebaseIDToken: Content {

    var token: String

    public var idToken: Usecase.Firebase.IDToken {
        .init(token)
    }
}
