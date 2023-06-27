import XCTest

@testable import Entity

final class PenaltyTests: XCTestCase {
    
    func test_State() {
        let penaltyTestCases: [Penalty: Penalty.State] = [
            .sendUserMessage(
                destine: .init(),
                amount: .init(),
                note: "",
                message: "",
                state: .executed(at: .init(at: 3))
            ): .executed(at: .init(at: 3)),
            
            .sendUserMessage(
                destine: .init(),
                amount: .init(),
                note: "",
                message: "",
                state: .unexecuted
            ): .unexecuted,
        ]
        
        for (penalty, expected) in penaltyTestCases {
            XCTAssertEqual(penalty.state, expected)
        }
    }
    
    func test_amount() {
        let penaltyTestCases: [Penalty: Penalty.Amount] = [
            .sendUserMessage(
                destine: .init(),
                amount: .init(1000),
                note: "",
                message: "",
                state: .executed(at: .init(at: 3))
            ): .init(1000),
        ]
        
        for (penalty, expected) in penaltyTestCases {
            XCTAssertEqual(penalty.amount, expected)
        }
    }
}
