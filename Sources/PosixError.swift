//
//  PosixError.swift
//  RuPosixError
//
//  Created by omochimetaru on 2017/03/31.
//
//

import Darwin

public struct PosixError : Error, CustomStringConvertible {
    public init(code: POSIXErrorCode) {
        let s = strerror(code.rawValue)!
        self.init(code: code,
                  description: String(cString: s))
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
