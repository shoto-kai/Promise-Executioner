@testable import Persistence
import XCTest
import Entity

final class PairNotificationTests: XCTestCase {
    
    func testモデルとエンティティ間の変換() throws {
        let from = Entity.User()
        var to = Entity.User()
        to.displayName = "Bob"
        
        let expected = Entity.PairNotification(
            id: .init(.init()),
            from: from,
            to: to,
            kind: .penalty,
            title: "Hello",
            noticedAt: .init(at: 3),
            readAt: .init(at: 4)
        )
        let model = expected.toModel
        model.$from.value = from.toModel
        model.$to.value = to.toModel
        
        let actual = try model.toEntity
        
        XCTAssertEqual(actual, expected)
    }
}
