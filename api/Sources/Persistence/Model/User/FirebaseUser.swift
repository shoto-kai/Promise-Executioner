import Foundation
import Fluent
import Entity
import Usecase

final class FirebaseUser: Model {
    
    static let schema = "firebase_users"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "user_id")
    var user: User
    
    @Field(key: "email_verified")
    var emailVerified: Bool?
    
    @Field(key: "email")
    var email: String?
    
    @Field(key: "picture")
    var picture: String?
    
    @Field(key: "uid")
    var uid: String
    
    @Field(key: "provider_id")
    var providerId: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(
        id: UUID? = nil,
        userID: User.IDValue,
        emailVerified: Bool?,
        email: String?,
        picture: String?,
        uid: String,
        providerId: String?
    ) {
        self.id = id
        self.$user.id = userID
        self.emailVerified = emailVerified
        self.email = email
        self.picture = picture
        self.uid = uid
        self.providerId = providerId
    }
}

extension FirebaseUser {
    var toEntity: Firebase.User {
        get throws {
            guard let userModel = $user.value else {
                throw DBError.loadError
            }
            return try .init(
                user: userModel.toEntity,
                emailVerified: emailVerified,
                email: email,
                picture: picture,
                uid: uid,
                providerId: providerId
            )
        }
    }
}

extension Firebase.User {
    var toModel: FirebaseUser {
        .init(
            userID: user.id.value,
            emailVerified: emailVerified,
            email: email,
            picture: picture,
            uid: uid,
            providerId: providerId
        )
    }
}

