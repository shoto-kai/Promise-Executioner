import Entity
import Firebase
import Foundation
import Repository
import ServiceProtocol
import Usecase

public struct FirebaseUserAuthenticator<
    Finder: FirebaseUserFindable,
    Creator: FirebaseUserCreatable
>: IDTokenAuthenticateService {

    private var authClient: AuthClient

    private var firebaseUserFinder: Finder

    private var firebaseUserCreator: Creator

    public init(
        authClient: AuthClient,
        firebaseUserFinder: Finder,
        firebaseUserCreator: Creator
    ) {
        self.authClient = authClient
        self.firebaseUserFinder = firebaseUserFinder
        self.firebaseUserCreator = firebaseUserCreator
    }

    public func authenticate(token: Usecase.Firebase.IDToken) async throws -> Usecase.Firebase.User
    {
        let uid = try await fetchFirebaseUid(token: token)

        if let firebaseUser = try await firebaseUserFinder.find(uid: uid) {
            return firebaseUser
        }

        let firebase = try await authClient.getUser(uid: uid)

        let firebaseUser = try createFirebaseUser(from: firebase, userID: uid)

        try await firebaseUserCreator.create(firebaseUser)

        return firebaseUser
    }

    /// uidでFirebaseUserを新規作成する
    private func createFirebaseUser(from firebase: FirebaseUser, userID: String) throws
        -> Usecase.Firebase.User
    {
        let user = try Entity.User(
            id: .init(.init()),
            name: .init(firebase.displayName ?? UUID().uuidString.lowercased()),
            displayName: firebase.displayName ?? "未設定"
        )
        return Usecase.Firebase.User(
            user: user,
            emailVerified: firebase.emailVerified,
            email: firebase.email,
            picture: firebase.photoUrl,
            uid: userID,
            providerId: firebase.providerId
        )
    }

    /// Firebaseのuidを取得する
    private func fetchFirebaseUid(token: Usecase.Firebase.IDToken) async throws -> String {
        let jwtResponse = try await authClient.validate(idToken: token.value)
        return jwtResponse.userID
    }

}
