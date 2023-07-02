import Foundation

extension AppPromise {
    public enum Task: Hashable, Codable {
        case push(deadline: PushTask.DeadlineRestriction?)
    }
}

extension AppPromise.Task {

    public func isExpired(now: Date) -> Bool {
        each.isExpired(now: now)
    }

    private var each: TaskCase {
        switch self {
        case .push(let deadline):
            return PushTask.Case(deadline: deadline)
        }
    }
}
