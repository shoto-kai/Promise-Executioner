import Entity
import Vapor

extension AppPromise {
    public enum State: String, Content, Hashable {
        case incomplete, completed, failed
    }
}

extension Entity.AppPromise.State {
    public var toContent: AppPromise.State {
        switch self {
        case .incomplete:
            return .incomplete
        case .completed(at: _):
            return .completed
        case .failed(at: _):
            return .failed
        }
    }
}
