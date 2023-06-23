import Entity
import Fluent
import Foundation

final class PushRestriction: Model {

    static let schema = "push_restrictions"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "task_id")
    var task: AppTask

    @Field(key: "deadline")
    var deadline: Date?

    @Field(key: "completed_at")
    var completedAt: Date?

    @Field(key: "completed_at")
    var failedAt: Date?

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        taskID: AppTask.IDValue,
        deadline: Date?,
        completedAt: Date? = nil,
        failedAt: Date? = nil
    ) {
        self.id = id
        self.$task.id = taskID
        self.deadline = deadline
        self.completedAt = completedAt
        self.failedAt = failedAt
    }
}

extension Entity.Restriction {
    func toPushRestriction(
        of taskID: Entity.AppTask.ID
    ) -> PushRestriction? {
        guard case .push(let deadline) = self else {
            return nil
        }
        return .init(
            taskID: taskID.value,
            deadline: deadline
        )
    }
}

extension PushRestriction {
    var toEntity: Entity.Restriction {
        .push(deadline: deadline)
    }
}
