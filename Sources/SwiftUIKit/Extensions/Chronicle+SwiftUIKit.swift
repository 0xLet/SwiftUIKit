//
//  Chronicle+SwiftUIKit.swift
//  
//
//  Created by Leif on 6/1/21.
//

import Chronicle

public enum SwiftUIKitLogger {
    public static var formatter: ChronicleFormatter = Chronicle.DefaultFormatters.DefaultFormatter()
    
    public static var handler: ChronicleHandler = Chronicle.DefaultHandlers.PrintHandler()
    
    public static let console = Chronicle(
        label: "swiftuikit.console",
        formatter: SwiftUIKitLogger.formatter,
        handler: SwiftUIKitLogger.handler
    )
}

func log(level: Chronicle.LogLevel) {
    SwiftUIKitLogger.console.log(level: level)
}
