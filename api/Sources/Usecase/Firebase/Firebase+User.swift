import Entity

extension Firebase {
    
    public struct User: Hashable, Codable {
        
        public var user: Entity.User
        
        /// ユーザーが電子メールを持っている場合、ID トークンが属するユーザーの電子メールが検証されるかどうか。
        public var emailVerified: Bool?
        
        /// 利用可能な場合、ID トークンが属するユーザーの電子メール。
        public var email: String?
        
        /// 使用されたサインイン プロバイダーやプロバイダー固有の ID の詳細など、サインイン イベントに関する情報。
        public var firebase: Detail
        
        /// 応答の発行者の発行者 ID。
        public var iss: String
        
        /// 利用可能な場合、ID トークンが属するユーザーの電話番号。
        public var phoneNumber: String?
        
        /// 利用可能な場合、ID トークンが属するユーザーの写真の URL。
        public var picture: String?
        
        /// ID トークンが属していたユーザーに対応するuid 。
        public var sub: String
        
        /// ID トークンが属していたユーザーに対応するuid 。
        public var uid: String
        
        public init(
            user: Entity.User,
            emailVerified: Bool? = nil,
            email: String? = nil,
            firebase: Detail,
            iss: String,
            phoneNumber: String? = nil,
            picture: String? = nil,
            sub: String,
            uid: String
        ) {
            self.user = user
            self.emailVerified = emailVerified
            self.email = email
            self.firebase = firebase
            self.iss = iss
            self.phoneNumber = phoneNumber
            self.picture = picture
            self.sub = sub
            self.uid = uid
        }
    }
}

extension Firebase.User {
    public struct Detail: Hashable, Codable {
        
        public var signInProvider: String
        
        public var signInSecondFactor: String?
        
        public var secondFactorIdentifier: String?
        
        public var tenant: String?
        
        public init(
            signInProvider: String,
            signInSecondFactor: String? = nil,
            secondFactorIdentifier: String? = nil,
            tenant: String? = nil
        ) {
            self.signInProvider = signInProvider
            self.signInSecondFactor = signInSecondFactor
            self.secondFactorIdentifier = secondFactorIdentifier
            self.tenant = tenant
        }
    }
}
