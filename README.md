# AnimatedAlert

![License](https://img.shields.io/github/license/chrsp/AnimatedAlert) ![Swift Version](https://img.shields.io/badge/swift-5.5-orange.svg) ![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg)

AnimatedAlert is a flexible and customizable component for displaying animated alerts in your iOS app. It gives you full control over the animation and the view used to present your alerts, making it a powerful tool for enhancing user experience in your app.

## Motivation

AnimatedAlert was originally created as a replacement for [MDCSnackBar](https://m2.material.io/components/snackbars/ios), which Google discontinued in 2021. While it can serve as a drop-in replacement for SnackBars using the provided `ToastAlertCenter` class, AnimatedAlert goes further by allowing you to create your own custom animated alerts and even design custom animations.

## Installation

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/chrsp/AnimatedAlert.git

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/chrsp/AnimatedAlert.git", from: "1.0.0")
```

## How it Works

The heart of the AnimatedAlert component lies in the `AlertCenter` protocol, which serves as the foundation for managing how the center displays alerts. This protocol offers several key functionalities:

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

AnimatedAlert provides ready-made `AlertCenter` types like `ToastAlertCenter`, which emulates the Material Snackbar's appearance. Nevertheless, you have the freedom to create your own custom animations, views, or even entirely new `AlertCenter` implementations.

## Usage

To get started, include the library in your project by adding:

```swift
import AnimatedAlert
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

   ![dos](https://github.com/chrsp/AnimatedAlert/assets/2355749/f24968a2-8ed9-4910-a110-644a4929b43a)

2. **Display on the Window**:

   ```swift
   self.alertCenter.display(message: "Displayed on the window!", time: 1.0, onView: nil)
   ```

   ![donw](https://github.com/chrsp/AnimatedAlert/assets/2355749/15401b1d-99d7-4ae4-98a3-6e032681db78)

3. **Display with an Action Button**:

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: self.view, action: action)
   ```

   ![doswa](https://github.com/chrsp/AnimatedAlert/assets/2355749/ddb57092-d53e-4ef7-b698-966c4ee4b567)

4. **Display Action on the Window**:

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: nil, action: action)
   ```

   ![dowwa](https://github.com/chrsp/AnimatedAlert/assets/2355749/d4fd3433-ef4a-4fab-86a4-ae29325ff7a7)


## License

AnimatedAlert is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

---

If you have any questions, encounter issues, or would like to make suggestions, please don't hesitate to [send me an email](mailto:chrspx@gmail.com) or [leave me a message](https://twitter.com/ch0Rx).

I hope you find AnimatedAlert a valuable addition to your iOS development toolkit. Happy coding! 😉
