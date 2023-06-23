import Entity
import Fluent
import Repository

extension AppTaskRepository: AllUserTaskTakeable {
    public func takeAll(of userID: Entity.User.ID) async throws -> [Entity.AppTask] {
        try await Persistence.AppTask.query(on: db)
            .filter(\.$user.$id == userID.value)
            .with(\.$sendUserMessagePenalties)
            .with(\.$pushRestriction)
            .all()
            .map({ try $0.toEntity })
    }
}
