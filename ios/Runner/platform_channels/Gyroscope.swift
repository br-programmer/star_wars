//
//  Gyroscope.swift
//  Runner
//
//  Created by Brayan Cantos on 20/11/23.
//

import CoreMotion
import Foundation

class Gyroscope: NSObject {
    
    private let channel = "dev.brprogrammer.star_wars/gyroscope"
    private let event = "dev.brprogrammer.star_wars/gyroscope-listener"
    
    private let motion = CMMotionManager()
    private var binaryMessenger: FlutterBinaryMessenger!
    private var gyroscopeHandler: GyroscopeHandler?
    
    init(binaryMessenger: FlutterBinaryMessenger) {
        super.init()
        self.binaryMessenger = binaryMessenger
        let channel = FlutterMethodChannel(name: channel, binaryMessenger: self.binaryMessenger)
        channel.setMethodCallHandler(self.callHandler)
    }
    
    private func callHandler(call: FlutterMethodCall, result: FlutterResult) {
        switch call.method {
        case "check":
            let exist = self.motion.isGyroAvailable
            result(exist)
            if exist {
                self.gyroscopeHandler = GyroscopeHandler()
                createListener()
            }
        default:
            result(FlutterMethodNotImplemented)
        }
    }
    
    private func createListener() {
        let event = FlutterEventChannel(name: self.event, binaryMessenger: self.binaryMessenger)
        event.setStreamHandler(self.gyroscopeHandler)
        self.gyroscopeHandler?.startGyros()
    }
    
    public func stop() {
        if self.gyroscopeHandler != nil {
            self.gyroscopeHandler?.stopGyros()
        }
    }
}

