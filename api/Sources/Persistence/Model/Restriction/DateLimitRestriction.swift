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

