//
//  SeverityConfig.swift
//  SwiftLint
//
//  Created by Scott Hoyt on 1/20/16.
//  Copyright © 2016 Realm. All rights reserved.
//

import Foundation

public struct SeverityConfig: RuleConfig, Equatable {
    var severity: ViolationSeverity

    public init(_ severity: ViolationSeverity) {
        self.severity = severity
    }

    public mutating func setConfig(config: AnyObject) throws {
        let value = config as? String ?? (config as? [String: AnyObject])?["severity"] as? String
        if let value = value, let severity = ViolationSeverity(rawValue: value.capitalizedString) {
            self.severity = severity
        } else {
            throw ConfigurationError.UnknownConfiguration
        }
    }

    public func isEqualTo(ruleConfig: RuleConfig) -> Bool {
        if let config = ruleConfig as? SeverityConfig {
            return self == config
        }
        return false
    }
}

public func == (lhs: SeverityConfig, rhs: SeverityConfig) -> Bool {
    return lhs.severity == rhs.severity
}
