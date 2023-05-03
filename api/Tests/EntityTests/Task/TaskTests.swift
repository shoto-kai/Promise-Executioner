@testable import Entity
import XCTest

public final class TaskTests: XCTestCase {
    
    public static let values: [Task] = [
        .init(
            id: .init(UUID()),
            title: "集合時間",
            note: "BBQ: 10時から",
            restrictions: RestrictionsTests.values[0],
            penalties: PenaltiesTests.values[0]
        ),
        .init(
            id: .init(UUID()),
            title: "早起き",
            note: "6時に起きる",
            restrictions: RestrictionsTests.values[1],
            penalties: PenaltiesTests.values[1]
        ),
        .init(
            id: .init(UUID()),
            title: "帰宅時間",
            note: "16時に帰る",
            restrictions: RestrictionsTests.values[2],
            penalties: PenaltiesTests.values[2]
        ),
    ]
}
