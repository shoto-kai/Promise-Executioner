extension Penalty {
    /// 罰金
    public struct Amount: Hashable, Codable {

        public let value: Int

        public init(_ value: Int) {
            self.value = value
        }
    }
}
