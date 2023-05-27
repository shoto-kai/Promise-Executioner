import Foundation

extension PushCondition {
    public struct DeadlineRestriction: Hashable, Codable, Identifiable {
        
        public var id: Identifier<Self>
        
        public var deadline: Date
        
        public init(id: Identifier<Self>, deadline: Date) {
            self.id = id
            self.deadline = deadline
        }
    }
}

extension PushCondition.DeadlineRestriction: Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        lhs.deadline < rhs.deadline
    }
}
