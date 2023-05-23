@testable import Entity
import XCTest
import Testing

public final class SendMessageToUserPenaltyTests: XCTestCase {
    
    func test執行済み判定() {
        var penalty = SendMessageToUserPenalty()
        penalty.executedAt = .init(at: 4)
        XCTAssertTrue(penalty.isExecuted)
    }
    
    func test未執行判定() {
        var penalty = SendMessageToUserPenalty()
        penalty.executedAt = nil
        XCTAssertFalse(penalty.isExecuted)
    }
}
