public struct Conditions: Hashable, Codable {

    public var pushes: [PushCondition]

    public init(pushes: [PushCondition]) {
        self.pushes = pushes
    }
}
