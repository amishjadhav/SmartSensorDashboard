# 📱 Smart Sensor Dashboard (iOS)

A SwiftUI-based iOS application that demonstrates real-time device motion sensing using CoreMotion and CoreLocation.
The app visualizes tilt, rotation, and compass direction in an intuitive and interactive UI.

---

## 🚀 Features

* 🎯 **Level Indicator (Bubble Level)**

  * Visual representation of device tilt using a moving ball
  * Color feedback (Green = level, Red = tilted)

* 🧭 **Compass Direction**

  * Displays real-time heading (0°–360°)
  * Converts heading into human-readable directions (North, East, South, West)

* 📡 **Sensor Integration**

  * Accelerometer (raw motion data)
  * Gyroscope (rotation tracking)
  * DeviceMotion (sensor fusion for stable gravity data)

* 🛠 **Debug Mode**

  * Toggle to view raw sensor values
  * Helps understand underlying motion data

---

## 🧠 Technical Concepts Demonstrated

* **CoreMotion**

  * Accelerometer & Gyroscope integration
  * DeviceMotion for sensor fusion (gravity-based tilt)

* **CoreLocation**

  * Compass heading using CLLocationManager
  * Delegate pattern implementation

* **SwiftUI**

  * Reactive UI using `@StateObject` and `@Published`
  * Layout using `ZStack`, `VStack`, and alignment strategies
  * Animations for smooth motion feedback

* **Architecture**

  * Separation of concerns:

    * `MotionManager` → Handles motion data
    * `LocationManager` → Handles compass data
    * `DashboardView` → UI layer

---

## 📸 Screenshots

<img width="414" height="896" alt="Screenshot 2026-03-29 at 4 11 36 PM" src="https://github.com/user-attachments/assets/2f229264-72a0-498f-a566-632ac1dd7b5a" />

<img width="414" height="896" alt="Screenshot 2026-03-29 at 4 11 38 PM-1" src="https://github.com/user-attachments/assets/8dd34bb3-7090-4a58-90c4-e8eef2e4c5eb" />

---

## ⚙️ How It Works

1. **DeviceMotion** provides gravity data for stable tilt detection
2. Gravity values are mapped to screen coordinates using `.offset()`
3. The ball moves based on tilt direction
4. A threshold determines whether the device is level
5. Compass heading is converted into directional text

---

## 🧪 Example Use Cases

* Digital level tool (construction / alignment)
* Motion-based UI interactions
* Sensor data visualization
* Learning CoreMotion & CoreLocation

---

## 🛠 Requirements

* iOS 15+
* Xcode 14+
* Real device (recommended for accurate sensor data)

---

## 📦 Installation

```bash
git clone https://github.com/your-username/smart-sensor-dashboard.git
cd smart-sensor-dashboard
open SmartSensorDashboard.xcodeproj
```

---

## 📈 Future Improvements

* Adaptive layout for all screen sizes
* Smoother motion filtering (low-pass filter)
* AR-based alignment tools
* Custom UI themes

---

## 👨‍💻 Author

Built as part of iOS learning and portfolio development.

---

## ⭐️ If you found this useful

Give it a star ⭐️ on GitHub!
