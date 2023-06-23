import Entity
import Fluent
import Repository

extension AppTaskRepository: TaskDeletable {
    public func delete(_ taskID: Entity.AppTask.ID) async throws {
        try await delete(taskID, on: db)
    }

    func delete(_ taskID: Entity.AppTask.ID, on db: Database) async throws {
        try await db.transaction { transaction in
            try await PushRestriction.query(on: transaction)
                .filter(\.$task.$id == taskID.value)
                .delete()
            try await SendUserMessagePenalty.query(on: transaction)
                .filter(\.$task.$id == taskID.value)
                .delete()
            try await AppTask.query(on: transaction)
                .filter(\.$id == taskID.value)
                .delete()
        }
    }
}
