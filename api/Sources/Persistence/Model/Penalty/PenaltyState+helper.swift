import Entity
import Foundation

extension Entity.Penalty.State {

    init(_ executedAt: Date?) {
        if let executedAt {
            self = .executed(at: executedAt)
        } else {
            self = .unexecuted
        }
    }

    var executedAt: Date? {
        switch self {
        case .executed(let at):
            return at
        case .unexecuted:
            return nil
        }
    }

}
