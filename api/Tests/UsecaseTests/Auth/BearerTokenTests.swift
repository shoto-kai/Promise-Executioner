@testable import Usecase
import XCTest

final class BearerTokenTests: XCTestCase {
    
    func test生成() {
        let uuid = UUID()
        
        let expected = BearerToken(uuid.uuidString)
        let actual = BearerToken(uuid)
        
        XCTAssertEqual(actual, expected)
    }
}
