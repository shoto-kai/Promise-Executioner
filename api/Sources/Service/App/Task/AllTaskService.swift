import Entity
import Repository

public struct AllTaskService<T: AllTaskTakeable> {
    
    var allTaskTaker: T
    
    public init(allTaskTakeable: T) {
        self.allTaskTaker = allTaskTakeable
    }
    
    public func all(of userID: User.ID) async throws -> [AppTask] {
        try await allTaskTaker.takeAll(of: userID)
    }
    
}
