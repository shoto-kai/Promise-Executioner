import Foundation

final class PushRestrictionCase: RestrictionCase {

    private let deadline: Date?

    init(deadline: Date?) {
        self.deadline = deadline
    }

    override func isExpired(now: Date) -> Bool {
        guard let deadline else {
            return false
        }
        return deadline > now
    }
}
