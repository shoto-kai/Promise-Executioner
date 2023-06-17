import RegexBuilder

extension User {
    public struct Name: Hashable, Codable {

        public let value: String

        public init(_ value: String) throws {
            try Self.validate(value)
            self.value = value
        }

        public static func validate(_ value: String) throws {
            guard isValid(value) else {
                throw ApiError.validation(
                    reason: "\(value)にハイフン小文字数字以外が含まれています。"
                )
            }
        }

        private static func isValid(_ value: String) -> Bool {
            value.wholeMatch(
                of: Regex {
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
