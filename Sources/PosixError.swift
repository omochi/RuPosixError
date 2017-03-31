//
//  PosixError.swift
//  RuPosixError
//
//  Created by omochimetaru on 2017/03/31.
//
//

import Darwin

public struct PosixError : Error, CustomStringConvertible {
    public init(code: Int32) {
        guard let posixCode = POSIXErrorCode(rawValue: code) else {
            fatalError("not posix error code: \(code)")
        }
        let messageCStr = strerror(code)!
        let message = String(cString: messageCStr)
        self.init(code: posixCode,
                  message: message)
    }
    
    public init(code: POSIXErrorCode,
                message: String)
    {
        self.code = code
        self.message = message
    }
    
    public var code: POSIXErrorCode
    public var message: String
    
    public var description: String {
        return "PosixError(code: \(code.rawValue), message: \(message))"
    }
    
    public static func run(proc: () -> Int32) throws {
        let code = proc()
        guard code == 0 else {
            throw PosixError(code: code)
        }
    }
}
