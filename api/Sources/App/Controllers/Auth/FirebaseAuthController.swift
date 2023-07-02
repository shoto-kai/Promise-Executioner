//import Entity
//import Presentation
//import Provider
//import Vapor
//
//struct FirebaseAuthController: RouteCollection {
//
//    func boot(routes: RoutesBuilder) throws {
//        let firebase = routes.grouped("firebase")
//        firebase.post(use: authenticate)
//    }
//
//    func authenticate(req: Request) async throws -> BearerAuthToken {
//        let content = try req.content.decode(FirebaseIDToken.self)
//        let firebaseUser = try await req.firebaseUserAuthenticator.authenticate(
//            token: content.idToken)
//        let bearerToken = try await req.bearerTokenPublisher.publish(user: firebaseUser.user)
//        return bearerToken.toContent
//    }
//}
