@testable import Entity
import XCTest

public final class DateLimitRestrictionTests: XCTestCase {
    
    public static let values: [DateLimitRestriction] = [
        .init(id: .init(value: UUID()), limit: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)),
        .init(id: .init(value: UUID()), limit: Date(timeIntervalSince1970: 4 * 24 * 60 * 60), completedAt: Date(timeIntervalSince1970: 3 * 24 * 60 * 60)),
        .init(id: .init(value: UUID()), limit: Date(timeIntervalSince1970: 5 * 24 * 60 * 60), completedAt: Date(timeIntervalSince1970: 4 * 24 * 60 * 60)),
    ]
}
