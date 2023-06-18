import Entity
import Fluent
import Foundation

final class PenaltyPairNotificationKind: Model {

    static let schema = "penalty_pair_notification_kinds"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "task_id")
    var task: AppTask

    @Parent(key: "pair_notification_id")
    var notification: PairNotification

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    @Timestamp(key: "updated_at", on: .update)
    var updatedAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        taskID: AppTask.IDValue,
        notificationID: PairNotification.IDValue
    ) {
        self.id = id
        self.$task.id = taskID
        self.$notification.id = notificationID
    }
}

extension Entity.NotificationKind {
    func toPenaltyPairModel(of pairNotificationID: PairNotification.IDValue)
        -> PenaltyPairNotificationKind?
    {
        guard case .penalty(let task) = self else {
            return nil
        }
        return .init(
            taskID: task.id.value,
            notificationID: pairNotificationID
        )
    }
}

extension PenaltyPairNotificationKind {
    var toEntity: Entity.NotificationKind {
        get throws {
            guard let task = $task.value else {
                throw DBError.loadError
            }
            return try .penalty(task: task.toEntity)
        }
    }
}
