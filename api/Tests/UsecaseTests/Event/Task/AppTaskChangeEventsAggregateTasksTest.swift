import XCTest
import Entity
import Testing

@testable import Usecase

final class AppTaskChangeEventsAggregateTasksTest: XCTestCase {
    
    func test集約できる() {
        
        var taskA = AppTask()
        taskA.title = "First"
        
        let createA = AppTaskCreateEvent(id: .init(.init()), task: taskA, at: .init(at: 1))
        
        taskA.title = "Second"
        let updateA1 = AppTaskUpdateEvent(id: .init(.init()), task: taskA, at: .init(at: 2))
        
        taskA.title = "Third"
        let updateA2 = AppTaskUpdateEvent(id: .init(.init()), task: taskA, at: .init(at: 3))
        
        var taskB = AppTask()
        taskB.title = "1番目"
        
        let createB = AppTaskCreateEvent(id: .init(.init()), task: taskB, at: .init(at: 2))
        
        taskB.title = "2番目"
        let updateB = AppTaskUpdateEvent(id: .init(.init()), task: taskB, at: .init(at: 3))
        
        var taskC = AppTask()
        taskC.title = "One"
        
        let createC = AppTaskCreateEvent(id: .init(.init()), task: taskC, at: .init(at: 3))
        
        let deleteC = AppTaskDeleteEvent(id: .init(.init()), taskID: taskC.id, at: .init(at: 4))
        
        let events: [AppTaskChangeEvent] = [
            .delete(event: deleteC),
            .create(event: createC),
            .update(event: updateB),
            .create(event: createB),
            .update(event: updateA1),
            .update(event: updateA2),
            .create(event: createA),
        ]
        
        let expected: Set<AppTask> = [taskA, taskB]
        let actual = Set(events.aggregateTasks())
        XCTAssertEqual(actual, expected)
    }
}
