import RegexBuilder

extension User {
    public struct Name: Hashable, Codable {
        
        public let value: String
        
        public init?(_ value: String) {
            guard Self.isValid(value) else {
                return nil
            }
            self.value = value
        }
        
        public static func isValid(_ value: String) -> Bool {
            value.wholeMatch(of: Regex {
                Anchor.startOfLine
                OneOrMore {
                    CharacterClass(
                        .anyOf("-"),
                        ("a"..."z"),
                        ("0"..."9")
                    )
                }
                Anchor.endOfLine
            }) != nil
        }
    }
}

extension User.Name: Comparable {
    public static func < (lhs: User.Name, rhs: User.Name) -> Bool {
        lhs.value < rhs.value
    }
}
