import Foundation

public enum ApiError: Error, Hashable, Codable {
    case validation(reason: String)
}
