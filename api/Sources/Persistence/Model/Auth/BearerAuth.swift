import Fluent
import Foundation

final class BearerAuth: Model {

    static let schema = "bearer_authes"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "user_id")
    var user: User

    @Field(key: "token")
    var token: String

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() {}

    init(id: UUID? = nil, userID: User.IDValue, token: String) async throws {
        self.id = id
        self.$user.id = userID
        self.token = token
    }

}
