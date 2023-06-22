import Vapor
import Entity

extension AppTask {
    public enum State: String, Content, Hashable {
        case incomplete, completed, failed
    }
}

extension Entity.AppTask.State {
    public var toContent: AppTask.State {
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
