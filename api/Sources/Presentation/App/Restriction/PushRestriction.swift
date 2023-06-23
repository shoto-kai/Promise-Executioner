import Entity
import Vapor

public struct PushRestriction: Content, Hashable {
    var deadline: Date?
}

extension PushRestriction {
    public var toEntity: Entity.Restriction {
        .push(deadline: deadline)
    }
}

extension Entity.Restriction {
    public var toContent: PushRestriction? {
        guard case .push(let deadline) = self else {
            return nil
        }
        return .init(deadline: deadline)
    }
}
