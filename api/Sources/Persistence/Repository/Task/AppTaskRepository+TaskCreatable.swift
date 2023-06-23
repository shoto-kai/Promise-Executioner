import Entity
import Fluent
import Repository

extension AppTaskRepository: TaskCreatable {

    public func create(_ task: Entity.AppTask, of userID: Entity.User.ID) async throws {
        try await create(task, of: userID, on: db)
    }

    func create(
        _ task: Entity.AppTask,
        of userID: Entity.User.ID,
        on db: Database
    ) async throws {
        try await db.transaction { transaction in
            try await task.toModel(of: userID).create(on: transaction)
            try await task.penalties.compactMap { penalty in
                penalty.toSendUserMessagePenalties(of: task.id.value)
            }.create(on: transaction)
            try await task.restriction.toPushRestriction(of: task.id)?.create(on: transaction)
        }
    }
}
