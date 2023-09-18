# AlertCenter

![License](https://img.shields.io/github/license/chrsp/AlertCenter) ![Swift Version](https://img.shields.io/badge/swift-5.5-orange.svg) ![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg)

AlertCenter is a flexible and customizable component for displaying animated alerts in your iOS app. It gives you full control over the animation and the view used to present your alerts, making it a powerful tool for enhancing user experience in your app.

## Motivation

AlertCenter was originally created as a replacement for [MDCSnackBar](https://m2.material.io/components/snackbars/ios), which Google discontinued in 2021. While it can serve as a drop-in replacement for SnackBars using the provided `ToastAlertCenter` class, AlertCenter goes further by allowing you to create your own custom animated alerts and even design custom animations.

## Installation

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/chrsp/AlertCenter.git

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/chrsp/AlertCenter.git", from: "1.0.0")
```

## How it Works

The heart of the AlertCenter component lies in the `AlertCenter` protocol, which serves as the foundation for managing how the center displays alerts. This protocol offers several key functionalities:

```swift
public protocol AlertCenter: AnyObject {
    // 1
    associatedtype AlertView: AnimatedAlert
    // 2
    var animator: AlertAnimator { get set }
    // 3
    var alertQueue: [AlertView] { get set }
    // 4
    func display(message: String, time: TimeInterval, onView: UIView?, action: ToastAction?) 
}
```

1. **AlertView Customization**:
   You can tailor the appearance of the alert views by associating them with your preferred `AlertView` conforming to the `AnimatedAlert` protocol.

2. **Animation Control**:
   Customize the animations applied to the alerts through the `AlertAnimator` property.

3. **Alert Queue Management**:
   Maintain a queue of alerts to ensure they are displayed in an orderly fashion.

4. **Display Alerts**:
   Request the center to display an alert with specific parameters, such as the message, display duration, target view, and an optional action.

AlertCenter provides ready-made `AlertCenter` types like `ToastAlertCenter`, which emulates the Material Snackbar's appearance. Nevertheless, you have the freedom to create your own custom animations, views, or even entirely new `AlertCenter` implementations.

## Usage

To get started, include the library in your project by adding:

```swift
import AlertCenter
```

Then, initialize your preferred `AlertCenter` instance, for example:

```swift
var alertCenter = ToastAlertCenter<MDCSnackbarToastAlert>()
```

Finally, choose how you want to present your Animated Alert:

1. **Display on a Specific View**:

   ```swift
   self.alertCenter.display(message: "Displayed on this view!", time: 1.0, onView: self.view)
   ```
   ![1](https://github.com/chrsp/AlertCenter/assets/2355749/15125e0a-4164-4136-be14-62c071081dd4)

2. **Display on the Window**:

   ```swift
   self.alertCenter.display(message: "Displayed on the window!", time: 1.0, onView: nil)
   ```

   ![2](https://github.com/chrsp/AlertCenter/assets/2355749/bfe3e735-4766-4351-aef8-218dbc477576)

3. **Display with an Action Button**:

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: self.view, action: action)
   ```

   ![3](https://github.com/chrsp/AlertCenter/assets/2355749/9874fe46-4cec-4f64-ac57-2a15946a4732)

4. **Display Action on the Window**:

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: nil, action: action)
   ```

   ![4](https://github.com/chrsp/AlertCenter/assets/2355749/1c3f5d44-2f61-47f9-8e38-b63d43e4612b)

## License

AlertCenter is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

---

If you have any questions, encounter issues, or would like to make suggestions, please don't hesitate to [send me an email](mailto:chrspx@gmail.com) or [leave me a message](https://twitter.com/ch0Rx).

I hope you find AlertCenter a valuable addition to your iOS development toolkit. Happy coding! 😉
