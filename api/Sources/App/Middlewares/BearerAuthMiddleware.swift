import Entity
import Vapor

struct BearerAuthMiddleware: AsyncBearerAuthenticator {

    func authenticate(bearer: Vapor.BearerAuthorization, for request: Vapor.Request) async throws {
        guard
            let user = try await request.bearerTokenAuthenticator
                .authenticate(token: .init(bearer.token))
        else {
            return
        }
        request.auth.login(user)
    }

}
