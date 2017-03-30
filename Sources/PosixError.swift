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
        let s = strerror(posixCode.rawValue)!
        let description = String(cString: s)
        self.init(code: posixCode,
                  description: description)
    }
    
    public init(code: POSIXErrorCode,
                description: String)
    {
        self.code = code
        self.description = description
    }
    
    public var code: POSIXErrorCode
    public var description: String
}
