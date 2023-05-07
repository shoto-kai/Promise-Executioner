import Foundation
import Fluent
import Entity

final class DateLimitRestriction: Model {
    
    static let schema = "date_limit_restrictions"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "task_id")
    var task: AppTask
    
    @Field(key: "limit")
    var limit: Date
    
    @Field(key: "completed_at")
    var completedAt: Date?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(
        id: UUID? = nil,
        taskID: AppTask.IDValue,
        limit: Date,
        completedAt: Date? = nil
    ) {
        self.id = id
        self.$task.id = taskID
        self.limit = limit
        self.completedAt = completedAt
    }
}

extension DateLimitRestriction {
    convenience init(
        _ entity: Entity.DateLimitRestriction,
        of taskID: Entity.AppTask.ID
    ) {
        self.init(
            id: entity.id.value,
            taskID: taskID.value,
            limit: entity.limit,
            completedAt: entity.completedAt
        )
    }
}

extension DateLimitRestriction {
    var toEntity: Entity.DateLimitRestriction {
        get throws {
            try .init(
                id: .init(requireID()),
                limit: limit,
                completedAt: completedAt
            )
        }
    }
}

