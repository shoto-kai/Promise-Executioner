//import Entity
//import Presentation
//import Provider
//import Vapor
//
//struct SessionAuthController: RouteCollection {
//
//    func boot(routes: RoutesBuilder) throws {
//        let session = routes.grouped("session")
//        session.patch(use: publish)
//        session.post(use: create)
//        session.delete(use: delete)
//    }
//
//    /// セッション情報のBearerトークンを発行する
//    func publish(req: Request) async throws -> BearerAuthToken {
//        guard let user = try await req.sessionAuthenticator.authenticate() else {
//            throw Abort(.notFound, reason: "未登録のユーザー")
//        }
//        let token = try await req.bearerTokenPublisher.publish(user: user)
//        return token.toContent
//    }
//
//    func create(req: Request) async throws -> HTTPStatus {
//        let user = try req.auth.require(User.self)
//        try await req.sessionAuthRegisterer.register(userID: user.id)
//        return .created
//    }
//
//    func delete(req: Request) async throws -> HTTPStatus {
//        try await req.sessionAuthDestroyer.destroy()
//        return .ok
//    }
//}
