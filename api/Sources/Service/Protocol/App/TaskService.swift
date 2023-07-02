import Entity
import Foundation

public protocol TaskFindable {
    func find(_ id: AppPromise.ID) async throws -> AppPromise?
}

public protocol AllUserTaskTakeable {
    func takeAll(of: User.ID) async throws -> [AppPromise]
}

public protocol TaskCreatable {
    func create(task: AppPromise, of: User, at: Date) async throws
}

public protocol TaskUpdatable {
    func update(task: AppPromise) async throws
}

public protocol TaskDeletable {
    func delete(_ id: AppPromise.ID) async throws
}
