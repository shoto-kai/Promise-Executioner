import Fluent
import PostgresKit

extension Fluent.Database {
    func createIndex(schema: String, columns: String...) async throws {
        let indexID = "\(schema)_\(columns.joined(separator: "_"))_index"
        _ = try await (self as! SQLDatabase).raw(
            """
                CREATE INDEX \(raw: indexID)
                    ON \(raw: schema) (\(raw: columns.joined(separator: ", ")))
            """
        ).all()
    }
}
