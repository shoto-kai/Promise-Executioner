import Entity

extension Firebase {

    public struct User: Hashable, Codable {

        public var user: Entity.User

        /// ユーザーが電子メールを持っている場合、ID トークンが属するユーザーの電子メールが検証されるかどうか。
        public var emailVerified: Bool?

        /// 利用可能な場合、ID トークンが属するユーザーの電子メール。
        public var email: String?

        /// 利用可能な場合、ID トークンが属するユーザーの写真の URL。
        public var picture: String?

        /// ID トークンが属していたユーザーに対応するuid 。
        public var uid: String

        public var providerId: String?

        public init(
            user: Entity.User,
            emailVerified: Bool? = nil,
            email: String? = nil,
            picture: String?,
            uid: String,
            providerId: String?
        ) {
            self.user = user
            self.emailVerified = emailVerified
            self.email = email
            self.picture = picture
            self.uid = uid
            self.providerId = providerId
        }
    }
}
