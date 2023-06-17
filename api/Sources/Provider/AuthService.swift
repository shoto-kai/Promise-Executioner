import ServiceAuth
import ServiceProtocol
import Vapor

extension Request {

    public var bearerTokenPublisher: some BearerTokenPublishable {
        BearerTokenPublisher(bearerUserSaver)
    }

    public var bearerTokenAuthenticator: some BearerTokenAuthenticable {
        BearerTokenAuthenticator(userFinderByBearerToken)
    }
}
