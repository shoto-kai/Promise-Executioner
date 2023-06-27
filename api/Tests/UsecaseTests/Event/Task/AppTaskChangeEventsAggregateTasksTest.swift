import XCTest
import Entity
import Testing

@testable import Usecase

final class AppTaskChangeEventsAggregateTasksTest: XCTestCase {
    
    func test集約できる() {
        
        var taskA = AppTask()
        taskA.title = "First"
        
        var createA = AppTaskCreateEvent()
        createA.task = taskA
        createA.at = .init(at: 1)
        
        taskA.title = "Second"
        var updateA1 = AppTaskUpdateEvent()
        updateA1.task = taskA
        updateA1.at = .init(at: 2)
        
        taskA.title = "Third"
        var updateA2 = AppTaskUpdateEvent()
        updateA2.task = taskA
        updateA2.at = .init(at: 3)
        
        var taskB = AppTask()
        taskB.title = "1番目"
        
        var createB = AppTaskCreateEvent()
        createB.task = taskB
        createB.at = .init(at: 2)
        
        taskB.title = "2番目"
        var updateB = AppTaskUpdateEvent()
        updateB.task = taskB
        updateB.at = .init(at: 3)
        
        var taskC = AppTask()
        taskC.title = "One"
        
        var createC = AppTaskCreateEvent()
        createC.task = taskC
        createC.at = .init(at: 3)
        
        var deleteC = AppTaskDeleteEvent()
        deleteC.taskID = taskC.id
        deleteC.at = .init(at: 4)
        
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
