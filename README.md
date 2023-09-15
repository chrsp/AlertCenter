# AnimatedAlert

![License](https://img.shields.io/github/license/chrsp/AnimatedAlert) ![Swift Version](https://img.shields.io/badge/swift-5.5-orange.svg) ![Platform](https://img.shields.io/badge/platform-iOS%2013%2B-blue.svg)

AnimatedAlert is a flexible and customizable component for displaying animated alerts in your iOS app. With AnimatedAlert, you have full control over the animation and the view used to present your alerts, making it a powerful tool for enhancing user experience in your app. It can also serve as a replacement for the Material SnackBar component, which was discontinued in 2021.

## Features

- **Customizable Animations:** AnimatedAlert allows you to easily define and customize animations for your alerts, giving you full creative control over how they appear and disappear on the screen.

- **Flexible Content:** You can use any custom view or UI elements as the content of your alerts. This means you're not limited to simple text messages; you can create rich, interactive alerts tailored to your app's needs.

- **Easy Integration:** Integrating AnimatedAlert into your project is straightforward, thanks to Swift Package Manager support. Simply add it as a dependency, and you're ready to start using it in your app.

- **Material SnackBar Replacement:** If you were using the Material SnackBar component in your app and are looking for a modern replacement, AnimatedAlert is a great alternative. It provides similar functionality while offering more flexibility and customization options.

## Installation

1. In Xcode, select “File” → “Add Packages...”
1. Enter https://github.com/chrsp/AnimatedAlert.git

or you can add the following dependency to your `Package.swift`:

```swift
.package(url: "https://github.com/chrsp/AnimatedAlert.git", from: "1.0.0")
```

## Usage

To harness the power of AnimatedAlert, you'll need an `AlertCenter`. AnimatedAlert includes a pre-built one called `ToastAlertCenter`, which replicates the Material Snackbar's look and feel. However, you're free to create your custom animations, views, or even your own `AlertCenter`.

Begin by importing the library:

```swift
import AnimatedAlert
```

Next, create your preferred `AlertCenter`:

```swift
var alertCenter = ToastAlertCenter<MDCSnackbarToastAlert>()
```

Finally, choose how you want to present your Animated Alert:

1. **Display on a Specific View:**

   ```swift
   self.alertCenter.display(message: "Displayed on this view!", time: 1.0, onView: self.view)
   ```

   ![animated_alert_normal_display](https://github.com/chrsp/ToastAlert/assets/2355749/0a8fd13b-3010-4c88-9a90-9aecc3eaaade)

2. **Display on the Window:**

   ```swift
   self.alertCenter.display(message: "Displayed on the window!", time: 1.0, onView: nil)
   ```

   ![animated_alert_normal_display_on_window](https://github.com/chrsp/ToastAlert/assets/2355749/3fa2ec95-857c-4d68-83f7-bdf76ea7be8b)

3. **Display with an Action Button:**

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: self.view, action: action)
   ```

   ![animated_alert_normal_display_w_button](https://github.com/chrsp/ToastAlert/assets/2355749/f419dd19-da88-46bf-b592-5609a9f5bdaa)

4. **Display Action on the Window:**

   ```swift
   self.alertCenter.display(message: "Displayed with Action", time: 2.0, onView: nil, action: action)
   ```

   ![animated_alert_window_display_w_button](https://github.com/chrsp/ToastAlert/assets/2355749/69dd6af1-02e6-4ddf-9316-70e67283a3b4)

AnimatedAlert comes equipped with a built-in request queue, simplifying the handling of multiple requests to display alerts from the same `AlertCenter`.

For more detailed usage instructions and customization options, please refer to the documentation.

## License

AnimatedAlert is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

## Contributing

If you'd like to contribute to AnimatedAlert, please see our [Contribution Guidelines](CONTRIBUTING.md).

## Contact

If you have any questions, issues, or suggestions, feel free to reach out to us at [chrspx@gmail.com](mailto:chrspx@gmail.com).

---

I hope you find AnimatedAlert a valuable addition to your iOS development toolkit. If you encounter any challenges or have ideas for further enhancements, don't hesitate to get in touch. Happy coding! 😉

