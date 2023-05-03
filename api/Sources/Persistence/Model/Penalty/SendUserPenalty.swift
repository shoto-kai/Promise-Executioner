import Foundation
import Fluent
import Entity

final class SendUserPenalty: Model {
    
    static let schema = "send_user_penalties"
    
    @ID(key: .id)
    var id: UUID?
    
    @Parent(key: "task_id")
    var task: AppTask
    
    @Parent(key: "destination_user_id")
    var destinationUser: User
    
    @Field(key: "overview")
    var overview: String
    
    @Field(key: "note")
    var note: String
    
    @Field(key: "content")
    var content: String
    
    @Field(key: "executed_at")
    var executedAt: Date?
    
    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?
    
    init() { }
    
    init(
        id: UUID? = nil,
        taskID: AppTask.IDValue,
        destinationUserID: User.IDValue,
        overview: String,
        note: String,
        content: String,
        executedAt: Date? = nil
    ) {
        self.id = id
        self.$task.id = taskID
        self.$destinationUser.id = destinationUserID
        self.overview = overview
        self.note = note
        self.content = content
        self.executedAt = executedAt
    }
}

