import Entity
import Fluent
import Foundation

final class PushCondition: Model {

    static let schema = "push_button_conditions"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "task_id")
    var task: AppTask

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
        completedAt: Date? = nil,
        failedAt: Date? = nil
    ) {
        self.id = id
        self.$task.id = taskID
        self.completedAt = completedAt
        self.failedAt = failedAt
    }

    //    @Children(for: \.$condition)
    //    var deadlineRestrictions: [DeadlineRestriction]
}

extension Entity.PushCondition {
    func toModel(
        of taskID: Entity.AppTask.ID
    ) -> Persistence.PushCondition {
        .init(
            id: id.value,
            taskID: taskID.value,
            completedAt: state.completedAt,
            failedAt: state.failedAt
        )
    }
}

extension PushCondition {
    ///
    /// - with deadlineRestrictions
    var toEntity: Entity.PushCondition {
        get throws {
            //            guard let deadlines = $deadlineRestrictions.value else {
            //                fatalError("期日制約がロードされていない")
            //            }
            return try .init(
                id: .init(requireID()),
                //                restrictions: deadlines.map { $0.toEntity },
                state: .init(completedAt, failedAt)
            )
        }
    }
}
