import Entity

/// ユーザーの全てのタスクを取得する
public protocol AllTaskTakeable {
    func takeAll() async throws -> [AppPromise]
}

/// ユーザーの全てのタスクを取得する
public protocol AllUserTaskTakeable {
    func takeAll(of: User.ID) async throws -> [AppPromise]
}

/// タスクを探す
public protocol TaskFindable {
    func find(_ id: AppPromise.ID) async throws -> AppPromise?
}

/// ユーザーのタスクを作成する
public protocol TaskCreatable {
    func create(_ task: AppPromise, of: User.ID) async throws
}

/// タスクを更新する
public protocol TaskUpdatable {
    func update(_ task: AppPromise) async throws
}

/// タスクを削除する
public protocol TaskDeletable {
    func delete(_ taskID: AppPromise.ID) async throws
}
