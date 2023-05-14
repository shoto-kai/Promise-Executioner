import Entity

public extension PushCondition.Restriction {
    init() {
        self = .deadline(at: .init(at: 0))
    }
}
