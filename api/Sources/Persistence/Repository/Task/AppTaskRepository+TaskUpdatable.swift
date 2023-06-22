import Entity
import Fluent
import Repository

extension AppTaskRepository: TaskUpdatable {
    public func update(_ task: Entity.AppTask) async throws {
        try await update(task, on: db)
    }

    private func update(_ task: Entity.AppTask, on db: Database) async throws {
        try await db.transaction { transaction in
            guard let model = try await AppTask.find(task.id.value, on: transaction) else {
                throw DBError.notFound
            }
            try await delete(task.id, on: transaction)
            try await create(task, of: .init(model.$user.id), on: transaction)
        }
    }
}
