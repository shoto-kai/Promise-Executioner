import Entity
import Fluent
import Foundation

final class PushTask: Model {

    static let schema = "push_tasks"

    @ID(key: .id)
    var id: UUID?

    @Parent(key: "promise_id")
    var promise: AppPromise

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?

    init() {}

    init(
        id: UUID? = nil,
        promiseID: AppPromise.IDValue
    ) {
        self.id = id
        self.$promise.id = promiseID
    }

    @OptionalChild(for: \.$pushTask)
    var deadline: DeadlineRestriction?
}

extension Entity.AppPromise.Task {
    func toPushTaskModel(of promiseID: Entity.AppPromise.ID) -> PushTask? {
        guard case .push(_) = self else {
            return nil
        }
        return .init(promiseID: promiseID.value)
    }
}

extension PushTask {
    var toEntity: Entity.AppPromise.Task {
        .push(deadline: deadlineRestrictionEntity)
    }

    private var deadlineRestrictionEntity: Entity.PushTask.DeadlineRestriction? {
        return deadline?.toEntity
    }
}
