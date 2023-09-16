# AnimatedAlert

![License](https://img.shields.io/github/license/chrsp/AnimatedAlert) ![Swift Version](https://img.shields.io/badge/swift-5.5-orange.svg) ![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg)

AnimatedAlert is a flexible and customizable component for displaying animated alerts in your iOS app. With AnimatedAlert, you have full control over the animation and the view used to present your alerts, making it a powerful tool for enhancing user experience in your app. It can also serve as a replacement for the Material SnackBar component, which was discontinued in 2021.

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
    associatedtype AlertView: AnimatedAlert // 1
    var animator: AlertAnimator { get set } // 2
    var alertQueue: [AlertView] { get set } // 3
    func display(message: String, time: TimeInterval, onView: UIView?, action: ToastAction?) // 4
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

   ![animated_alert_normal_display](https://github.com/chrsp/ToastAlert/assets/2355749/0a8fd13b-3010-4c88-9a90-9aecc3eaaade)

2. **Display on the Window**:

   ```swift
   self.alertCenter.display(message: "Displayed on the window!", time: 1.0, onView: nil)
   ```

   ![animated_alert_normal_display_on_window](https://github.com/chrsp/ToastAlert/assets/2355749/3fa2ec95-857c-4d68-83f7-bdf76ea7be8b)

3. **Display with an Action Button**:

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: self.view, action: action)
   ```

   ![animated_alert_normal_display_w_button](https://github.com/chrsp/ToastAlert/assets/2355749/f419dd19-da88-46bf-b592-5609a9f5bdaa)

4. **Display Action on the Window**:

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: nil, action: action)
   ```

   ![animated_alert_window_display_w_button](https://github.com/chrsp/ToastAlert/assets/2355749/69dd6af1-02e6-4ddf-9316-70e67283a3b4)

## License

AnimatedAlert is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

## Contributing

If you'd like to contribute to AnimatedAlert, please see our [Contribution Guidelines](CONTRIBUTING.md).

## Contact

If you have any questions, encounter issues, or would like to make suggestions, please don't hesitate to [send me an email](mailto:chrspx@gmail.com) or [leave a message](https://twitter.com/ch0Rx).

---

I hope you find AnimatedAlert a valuable addition to your iOS development toolkit. Happy coding! 😉

