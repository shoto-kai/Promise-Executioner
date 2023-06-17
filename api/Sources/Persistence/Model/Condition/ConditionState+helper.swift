import Entity
import Foundation

extension ConditionState {

    var completedAt: Date? {
        guard case let .completed(at) = self else {
            return nil
        }
        return at
    }

    var failedAt: Date? {
        guard case let .failed(at) = self else {
            return nil
        }
        return at
    }

    init(_ completedAt: Date?, _ failedAt: Date?) {
        guard completedAt == nil || failedAt == nil else {
            fatalError("completedAtとfailedAtが両方ある")
        }
        if let completedAt {
            self = .completed(at: completedAt)
            return
        }
        if let failedAt {
            self = .failed(at: failedAt)
            return
        }
        self = .incomplete
    }

}
