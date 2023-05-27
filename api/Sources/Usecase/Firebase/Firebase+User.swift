import Entity

extension Firebase {
    
    public struct User: Hashable, Codable {
        
        public var user: Entity.User
        
        /// このトークンが対象とするオーディエンス。
        public var aud: String
        
        /// エンドユーザー認証が発生したときの Unix エポックからの時間 (秒単位)。
        public var authTime: Int
        
        /// ユーザーが電子メールを持っている場合、ID トークンが属するユーザーの電子メールが検証されるかどうか。
        public var emailVerified: Bool?
        
        /// 利用可能な場合、ID トークンが属するユーザーの電子メール。
        public var email: String?
        
        /// ID トークンの有効期限 (Unix エポックからの秒数)。つまり、この ID トークンの有効期限が切れ、有効と見なされなくなる時刻です。
        public var exp: Int
        
        /// 使用されたサインイン プロバイダーやプロバイダー固有の ID の詳細など、サインイン イベントに関する情報。
        public var firebase: Detail
        
        /// ID トークンの発行時刻 (Unix エポックからの秒数)。つまり、この ID トークンが発行され、有効と見なされ始める時刻です。
        public var iat: Int
        
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
            aud: String,
            authTime: Int,
            emailVerified: Bool? = nil,
            email: String? = nil,
            exp: Int,
            firebase: Detail,
            iat: Int,
            iss: String,
            phoneNumber: String? = nil,
            picture: String? = nil,
            sub: String,
            uid: String
        ) {
            self.user = user
            self.aud = aud
            self.authTime = authTime
            self.emailVerified = emailVerified
            self.email = email
            self.exp = exp
            self.firebase = firebase
            self.iat = iat
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
