import Entity

public protocol TaskFetchable {
    func fetch(_ id: AppTask.ID) async throws -> AppTask?
}

public protocol PersonalTaskAllFetchable {
    func fetch(of: User) async throws -> [AppTask]
}

public protocol TaskCreatable {
    func create(task: AppTask, of: User) async throws
}

public protocol TaskUpdatable {
    func update(task: AppTask) async throws
}

public protocol TaskDeletable {
    func delete(_ id: AppTask.ID) async throws
}
