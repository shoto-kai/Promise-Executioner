import Entity
import Fluent
import Foundation

extension PushTask {
    final class DeadlineRestriction: Model {

        static let schema = "push_task_deadline_restriction"

        @ID(key: .id)
        var id: UUID?

        @Parent(key: "push_task_id")
        var pushTask: PushTask

        @Field(key: "deadline")
        var deadline: Date

        @Timestamp(key: "created_at", on: .create)
        var createdAt: Date?

        init() {}

        init(
            id: UUID? = nil,
            pushTaskID: PushTask.IDValue,
            deadline: Date
        ) {
            self.id = id
            self.$pushTask.id = pushTaskID
            self.deadline = deadline
        }
    }
}

extension Entity.PushTask.DeadlineRestriction {
    func toModel(of taskID: PushTask.IDValue) -> PushTask.DeadlineRestriction {
        .init(pushTaskID: taskID, deadline: at)
    }
}

extension PushTask.DeadlineRestriction {
    var toEntity: Entity.PushTask.DeadlineRestriction {
        .init(deadline)
    }
}
