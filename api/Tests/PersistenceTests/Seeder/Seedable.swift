import Fluent

protocol Seedable {
    func seed(on: Database) async throws
    func refresh(on: Database) async throws
}
