import Entity
import Presentation
import Provider
import Vapor

struct SessionAuthController: RouteCollection {

    private static let key = "user-id"

    func boot(routes: RoutesBuilder) throws {
        let session = routes.grouped("session")
        session.patch(use: publish)
        session.post(use: create)
        session.delete(use: delete)
    }

    /// セッション情報のBearerトークンを発行する
    func publish(req: Request) async throws -> BearerAuthToken {
        guard
            let userID = req.session.data[Self.key]
                .flatMap(UUID.init(uuidString:))
                .map(User.ID.init)
        else {
            throw Abort(.unauthorized)
        }
        guard let user = try await req.userFinder.find(userID) else {
            throw Abort(.notFound, reason: "未登録のユーザー")
        }
        let token = try await req.bearerTokenPublisher.publish(user: user)
        return token.toContent
    }

    func create(req: Request) async throws -> HTTPStatus {
        let user = try req.auth.require(User.self)
        req.session.data[Self.key] = user.id.value.uuidString
        return .created
    }

    func delete(req: Request) async throws -> HTTPStatus {
        req.session.destroy()
        return .ok
    }
}
