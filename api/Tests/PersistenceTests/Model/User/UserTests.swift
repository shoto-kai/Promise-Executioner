@testable import Persistence
import XCTest
import Entity

final class UserTests: XCTestCase {
    
    func testエンティティをモデルに変換() {
        let uuid = UUID()
        let entity = Entity.User(id: .init(uuid), name: "Alice")
        
        let model: Persistence.User = .init(entity)
        XCTAssertEqual(model.id, uuid)
        XCTAssertEqual(model.name, "Alice")
    }
    
    func testモデルをエンティティに変換() throws {
        let uuid = UUID()
        let model = Persistence.User(id: uuid, name: "Bob")
        
        let expected = Entity.User(id: .init(uuid), name: "Bob")
        let actual = try model.toEntity
        XCTAssertEqual(actual, expected)
    }
}
