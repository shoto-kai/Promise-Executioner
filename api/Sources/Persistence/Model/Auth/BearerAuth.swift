import Entity
import Fluent
import Foundation
import Usecase

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

    init(id: UUID? = nil, userID: User.IDValue, token: String) {
        self.id = id
        self.$user.id = userID
        self.token = token
    }
}

extension BearerAuth {
    var toEntity: Usecase.BearerAuth {
        get throws {
            try .init(user: userEntity, token: .init(token))
        }
    }

    private var userEntity: Entity.User {
        get throws {
            guard let user = $user.value else {
                throw DBError.loadError
            }
            return try user.toEntity
        }
    }
}

extension Usecase.BearerAuth {
    var toModel: BearerAuth {
        .init(userID: user.id.value, token: token.value)
    }
}
