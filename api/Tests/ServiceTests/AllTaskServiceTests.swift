@testable import Service
import XCTest
import Entity
import Repository
import Testing

public final class AllTaskServiceTests: XCTestCase {
    
    func test() async throws {
        var tasks = (0...2).map { _ in AppTask() }
        tasks[0].title = "タスク1"
        tasks[1].title = "タスク2"
        tasks[2].title = "タスク3"
        let userID = User.ID(.init())
        
        let mock = MockTaskTakeable(tasks: tasks)
        let service = AllTaskService(allTaskTakeable: mock)
        
        let actual = try await service.all(of: userID)
        XCTAssertEqual(actual, tasks)
        XCTAssertEqual(mock.userID, userID)
    }
}

fileprivate class MockTaskTakeable: AllTaskTakeable {
    
    var tasks: [AppTask]
    
    var userID: User.ID?
    
    init(tasks: [AppTask]) {
        self.tasks = tasks
    }
    
    func takeAll(of: User.ID) async throws -> [AppTask] {
        userID = of
        return tasks
    }
}
