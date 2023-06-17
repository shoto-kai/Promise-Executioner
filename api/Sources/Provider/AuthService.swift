import Vapor
import ServiceProtocol
import ServiceAuth

public extension Request {
    
    var bearerTokenPublisher: some BearerTokenPublishable {
        BearerTokenPublisher(bearerUserSaver)
    }
    
    var bearerTokenAuthenticator: some BearerTokenAuthenticable {
        BearerTokenAuthenticator(userFinderByBearerToken)
    }
}
