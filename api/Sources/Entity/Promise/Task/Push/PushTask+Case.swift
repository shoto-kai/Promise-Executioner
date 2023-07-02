import Foundation

extension PushTask {
    final class Case: TaskCase {

        private let deadline: PushTask.DeadlineRestriction?

        init(deadline: PushTask.DeadlineRestriction?) {
            self.deadline = deadline
        }

        override func isExpired(now: Date) -> Bool {
            guard let deadline else {
                return false
            }
            return deadline.isExpired(now: now)
        }
    }
}
