//
//  DashboardView.swift
//  SmartSensorDashboard
//
//

import SwiftUI

struct DashboardView: View {
    
    @StateObject private var motionManager = MotionManager()
    @StateObject private var locationManager = LocationManager()
    
    @State private var showRawData = false
    
    var body: some View {
        ZStack {
            
            ZStack {
                Circle()
                    .stroke(Color.gray.opacity(0.7), lineWidth: 2)
                    .frame(width: 180, height: 180)
                
                Circle()
                    .fill(isLevel() ? Color.green : Color.red)
                    .frame(width: 50, height: 50)
                    .offset(
                        x: motionManager.gravityX * 90,
                        y: -motionManager.gravityY * 90
                    )
                    .animation(.easeOut(duration: 0.2), value: motionManager.gravityX)
            }
            
            VStack(spacing: 8) {
                Text("Level + Compass")
                    .font(.headline)
                
                Text(locationManager.directionText(locationManager.heading))
                    .font(.largeTitle)
                    .bold()
                
                Text("\(locationManager.heading, specifier: "%.0f")°")
                    .font(.subheadline)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.top, 20)
            
            VStack {
                Spacer()
                
                Toggle("Show Sensor Data", isOn: $showRawData)
                    .padding(.horizontal)
                    .padding(.bottom, 20)
            }
            
            if showRawData {
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Text("Accelerometer").bold()
                            Text("X: \(motionManager.x, specifier: "%.2f")")
                            Text("Y: \(motionManager.y, specifier: "%.2f")")
                            Text("Z: \(motionManager.z, specifier: "%.2f")")
                            
                            Text("Gyroscope")
                                .bold()
                                .padding(.top, 4)
                            
                            Text("X: \(motionManager.rotationX, specifier: "%.2f")")
                            Text("Y: \(motionManager.rotationY, specifier: "%.2f")")
                            Text("Z: \(motionManager.rotationZ, specifier: "%.2f")")
                        }
                        .font(.system(size: 11))
                        .padding(12)
                        .background(.ultraThinMaterial)
                        .cornerRadius(12)
                        .padding(.trailing, 16)
                        .padding(.bottom, 70)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
        .onAppear {
            motionManager.startDeviceMotion()
            motionManager.startAccelerometer()
            motionManager.startGyroscope()
            locationManager.startHeading()
        }
    }
    
    func isLevel() -> Bool {
        abs(motionManager.gravityX) < 0.08 &&
        abs(motionManager.gravityY) < 0.08
    }
}

#Preview {
    DashboardView()
}
