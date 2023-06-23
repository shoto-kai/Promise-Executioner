import Entity

public protocol TaskFindable {
    func find(_ id: AppTask.ID) async throws -> AppTask?
}

public protocol AllUserTaskTakeable {
    func takeAll(of: User.ID) async throws -> [AppTask]
}

public protocol TaskCreatable {
    func create(task: AppTask, of: User.ID) async throws
}

public protocol TaskUpdatable {
    func update(task: AppTask) async throws
}

public protocol TaskDeletable {
    func delete(_ id: AppTask.ID) async throws
}
