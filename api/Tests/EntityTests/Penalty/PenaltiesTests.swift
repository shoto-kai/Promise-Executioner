@testable import Entity
import XCTest

public final class PenaltiesTests: XCTestCase {
    
    public static let values: [Penalties] = [
        .init(sendUserPenalties: []),
        .init(sendUserPenalties: [SendUserPenaltyTests.values[0]]),
        .init(sendUserPenalties: Array(SendUserPenaltyTests.values[1...2])),
    ]
}
