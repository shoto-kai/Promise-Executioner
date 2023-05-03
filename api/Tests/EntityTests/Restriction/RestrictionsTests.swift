@testable import Entity
import XCTest

public final class RestrictionsTests: XCTestCase {
    
    public static let values: [Restrictions] = [
        .init(dateLimitRestrictions: []),
        .init(dateLimitRestrictions: [DateLimitRestrictionTests.values[0]]),
        .init(dateLimitRestrictions: Array(DateLimitRestrictionTests.values[1...2])),
    ]
}
