import Entity

/// ユーザーの全てのタスクを取得する
public protocol AllTaskTakeable {
    func takeAll() async throws -> [AppTask]
}

/// ユーザーの全てのタスクを取得する
public protocol AllUserTaskTakeable {
    func takeAll(of: User.ID) async throws -> [AppTask]
}

/// タスクを探す
public protocol TaskFindable {
    func find(_ id: AppTask.ID) async throws -> AppTask?
}

/// ユーザーのタスクを作成する
public protocol TaskCreatable {
    func create(_ task: AppTask, of: User.ID) async throws
}

/// タスクを更新する
public protocol TaskUpdatable {
    func update(_ task: AppTask) async throws
}

/// タスクを削除する
public protocol TaskDeletable {
    func delete(_ taskID: AppTask.ID) async throws
}
