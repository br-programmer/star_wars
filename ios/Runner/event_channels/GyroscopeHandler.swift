import CoreMotion
//
//  GyroscopeHandler.swift
//  Runner
//
//  Created by Brayan Cantos on 20/11/23.
//
import Foundation

class GyroscopeHandler: NSObject, FlutterStreamHandler {
    
    var events: FlutterEventSink?
    var timer: Timer?
    
    private let motion = CMMotionManager()
    
    func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink)
    -> FlutterError?
    {
        self.events = events
        return nil
    }
    
    func onCancel(withArguments arguments: Any?) -> FlutterError? {
        return nil
    }
    
    public func startGyros() {
        if #available(iOS 10.0, *) {
            let percent: Double = 1.0 / 50.0
            self.motion.gyroUpdateInterval = percent
            self.motion.startGyroUpdates()
            self.timer = Timer(
                fire: Date(), interval: (percent),
                repeats: true,
                block: { (timer) in
                    if let data = self.motion.gyroData {
                        
                        let x = data.rotationRate.x
                        let y = data.rotationRate.y
                        let z = data.rotationRate.z
                        if self.events != nil {
                            self.events!([
                                "x": x,
                                "y": y,
                                "z": z,
                            ])
                        }
                    }
                })
            RunLoop.current.add(self.timer!, forMode: RunLoop.Mode.default)
        }
    }
    
    public func stopGyros() {
        if self.timer != nil {
            self.timer?.invalidate()
            self.timer = nil
            self.motion.stopGyroUpdates()
        }
    }
    
}
