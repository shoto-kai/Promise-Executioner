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
    
    @Field(key: "iss")
    var iss: String
    
    @Field(key: "phone_number")
    var phoneNumber: String?
    
    @Field(key: "picture")
    var picture: String?
    
    @Field(key: "sub")
    var sub: String
    
    @Field(key: "uid")
    var uid: String
    
    @Field(key: "sign_in_provider")
    var signInProvider: String
    
    @Field(key: "sign_in_second_factor")
    var signInSecondFactor: String?
    
    @Field(key: "second_factor_identifier")
    var secondFactorIdentifier: String?
    
    @Field(key: "tenant")
    var tenant: String?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(
        id: UUID? = nil,
        userID: User.IDValue,
        emailVerified: Bool? = nil,
        email: String?,
        iss: String,
        phoneNumber: String? = nil,
        picture: String? = nil,
        sub: String,
        uid: String,
        signInProvider: String,
        signInSecondFactor: String? = nil,
        secondFactorIdentifier: String? = nil,
        tenant: String? = nil
    ) {
        self.id = id
        self.$user.id = userID
        self.emailVerified = emailVerified
        self.email = email
        self.iss = iss
        self.phoneNumber = phoneNumber
        self.picture = picture
        self.sub = sub
        self.uid = uid
        self.signInProvider = signInProvider
        self.signInSecondFactor = signInSecondFactor
        self.secondFactorIdentifier = secondFactorIdentifier
        self.tenant = tenant
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
                firebase: detailEntity,
                iss: iss,
                phoneNumber: phoneNumber,
                picture: picture,
                sub: sub,
                uid: uid
            )
        }
    }
    
    private var detailEntity: Firebase.User.Detail {
        .init(
            signInProvider: signInProvider,
            signInSecondFactor: signInSecondFactor,
            secondFactorIdentifier: secondFactorIdentifier,
            tenant: tenant
        )
    }
}

extension Firebase.User {
    var toModel: FirebaseUser {
        .init(
            userID: user.id.value,
            emailVerified: emailVerified,
            email: email,
            iss: iss,
            phoneNumber: phoneNumber,
            picture: picture,
            sub: sub,
            uid: uid,
            signInProvider: firebase.signInProvider,
            signInSecondFactor: firebase.signInSecondFactor,
            secondFactorIdentifier: firebase.secondFactorIdentifier,
            tenant: firebase.tenant
        )
    }
}

