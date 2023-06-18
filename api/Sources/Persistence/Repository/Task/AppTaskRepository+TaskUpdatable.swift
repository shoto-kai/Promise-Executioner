import Entity
import Fluent
import Repository

extension AppTaskRepository: TaskUpdatable {
    public func update(
        _ task: Entity.AppTask,
        of userID: Entity.User.ID
    ) async throws {
        try await update(task, of: userID, on: db)
    }

    private func update(
        _ task: Entity.AppTask,
        of userID: Entity.User.ID,
        on db: Database
    ) async throws {
        try await db.transaction { transaction in
            try await delete(task.id, on: transaction)
            try await create(task, of: userID, on: transaction)
        }
    }
}
