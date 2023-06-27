import Foundation

public enum UsecaseError: Error, Hashable, Codable {
    case triedCreateButAlreadyExists
    case triedUpdateButNotFound
}
