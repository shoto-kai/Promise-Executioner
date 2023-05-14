import Entity

extension PairRoom {
    public struct ID: Hashable, Codable {
        
        public let pairIDs: Set<User.ID>
        
        public init?(_ ids: Set<User.ID>) {
            guard Self.isValid(ids) else {
                return nil
            }
            self.pairIDs = ids
        }
        
        public static func isValid(_ ids: Set<User.ID>) -> Bool {
            ids.count == 2
        }
    }
}
