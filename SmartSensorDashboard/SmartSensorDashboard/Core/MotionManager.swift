//
//  MotionManager.swift
//  SmartSensorDashboard
//
//

import Foundation
import Combine
import CoreMotion

final class MotionManager: ObservableObject {
    
    private let motionManager = CMMotionManager()
    
    @Published var x: Double = 0
    @Published var y: Double = 0
    @Published var z: Double = 0
    
    @Published var rotationX: Double = 0
    @Published var rotationY: Double = 0
    @Published var rotationZ: Double = 0
    
    @Published var gravityX: Double = 0
    @Published var gravityY: Double = 0
    @Published var gravityZ: Double = 0
    
    func startAccelerometer() {
        guard motionManager.isAccelerometerAvailable else {
            print("Accelerometer not available")
            return
        }
        
        motionManager.accelerometerUpdateInterval = 0.1
        
        motionManager.startAccelerometerUpdates(to: .main) { [weak self] data, error in
            
            guard let data = data else { return }
            
            self?.x = data.acceleration.x
            self?.y = data.acceleration.y
            self?.z = data.acceleration.z
        }
    }
    
    func startGyroscope() {
        guard motionManager.isGyroAvailable else {
            print("Gyroscope not available")
            return
        }
        
        motionManager.gyroUpdateInterval = 0.1
        
        motionManager.startGyroUpdates(to: .main) { [weak self] data, _ in
            
            guard let data = data else { return }
            
            self?.rotationX = data.rotationRate.x
            self?.rotationY = data.rotationRate.y
            self?.rotationZ = data.rotationRate.z
        }
    }
    
    func startDeviceMotion() {
        guard motionManager.isDeviceMotionAvailable else {
            print("DeviceMotion not available")
            return
        }
        
        motionManager.deviceMotionUpdateInterval = 0.1
        
        motionManager.startDeviceMotionUpdates(to: .main) { [weak self] data, _ in
            
            guard let data = data else { return }
            
            self?.gravityX = data.gravity.x
            self?.gravityY = data.gravity.y
            self?.gravityZ = data.gravity.z
        }
    }
}
