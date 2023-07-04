import Entity
import Vapor

extension Presentation.AppPromise {
    public struct PushTask: Content, Hashable {
        var deadline: Date?
    }
}

extension AppPromise.PushTask {
    public var toEntity: Entity.AppPromise.Task {
        .push(deadline: deadlineRestriction)
    }

    private var deadlineRestriction: Entity.PushTask.DeadlineRestriction? {
        guard let deadline else {
            return nil
        }
        return .init(deadline)
    }
}

extension Entity.AppPromise.Task {
    public var toPushTaskContent: AppPromise.PushTask? {
        guard case .push(let deadline) = self else {
            return nil
        }
        return .init(deadline: deadline?.at)
    }
}
