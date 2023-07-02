import Entity

extension AppPromise.Task {
    public init() {
        self = .push(deadline: nil)
    }
}
