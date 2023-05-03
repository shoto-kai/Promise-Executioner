import Entity

public let restrictionsList: [Restrictions] = [
    .init(dateLimitRestrictions: []),
    .init(dateLimitRestrictions: [dateLimitRestrictions[0]]),
    .init(dateLimitRestrictions: Array(dateLimitRestrictions[1...2])),
]
