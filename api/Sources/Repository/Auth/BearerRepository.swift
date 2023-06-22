import Entity
import Foundation
import Usecase

public protocol UserFindableByBearerToken {
    func find(_ token: BearerAuth.Token) async throws -> User?
}

/// 指定したユーザーIDとトークンでBearer認証を保存する
public protocol BearerUserSavible {
    func save(userID: User.ID, token: BearerAuth.Token) async throws
}

// 指定した日付よりも前のBearer認証情報を削除する
public protocol OldBearerAuthDeletable {
    func deleteBearerAuth(before: Date) async throws
}
