import ServiceAuth
import ServiceProtocol
import Vapor

extension Request {

    public var firebaseUserAuthenticator: some IDTokenAuthenticateService {
        FirebaseUserAuthenticator(
            authClient: firebase.auth,
            firebaseUserFinder: firebaseUserFinder,
            firebaseUserCreator: firebaseUserCreator
        )
    }

    public var bearerTokenPublisher: some BearerTokenPublishable {
        BearerTokenPublisher(bearerUserSaver)
    }

    public var bearerTokenAuthenticator: some BearerTokenAuthenticable {
        BearerTokenAuthenticator(userFinderByBearerToken)
    }

    public var sessionAuthenticator: some SessionAuthenticable {
        SessionAuthService(session: session, userFinder: userFinder)
    }

    public var sessionAuthRegisterer: some SessionAuthRegisterable {
        SessionAuthService(session: session, userFinder: userFinder)
    }

    public var sessionAuthDestroyer: some SessionAuthDestroyable {
        SessionAuthService(session: session, userFinder: userFinder)
    }
}
