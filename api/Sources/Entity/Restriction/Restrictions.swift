public struct Restrictions: Hashable, Codable {
    
    public var dateLimitRestrictions: [DateLimitRestriction]
    
    public init(dateLimitRestrictions: [DateLimitRestriction]) {
        self.dateLimitRestrictions = dateLimitRestrictions
    }
}
