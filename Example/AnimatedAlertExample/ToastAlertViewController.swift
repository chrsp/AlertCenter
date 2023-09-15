import UIKit
import AnimatedAlert
import Combine

class ToastAlertViewController: UIViewController {

    let displayToastInThisViewBtn = UIButton(type: .system)
    let displayToastOnWindowBtn = UIButton(type: .system)
    let displayToastWithActionBtn = UIButton(type: .system)
    let displayToastOnWindowWithActionBtn = UIButton(type: .system)
    let goToOtherScreenBtn = UIButton(type: .system)
    let toastsOnQueueLabel = UILabel()

    private var cancellables: Set<AnyCancellable> = []

    var alertCenter = ToastAlertCenter<MDCSnackbarToastAlert>()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let buttonStack = UIStackView(arrangedSubviews: [
            displayToastInThisViewBtn, displayToastOnWindowBtn, displayToastOnWindowWithActionBtn, displayToastWithActionBtn, goToOtherScreenBtn, toastsOnQueueLabel
        ])

        buttonStack.spacing = 24

        buttonStack.axis = .vertical
        toastsOnQueueLabel.textColor = .black
        toastsOnQueueLabel.textAlignment = .center

        view.addSubview(buttonStack)

        buttonStack.translatesAutoresizingMaskIntoConstraints = false

        displayToastInThisViewBtn.setTitle("Display Toast", for: .normal)
        displayToastInThisViewBtn.addAction(.init { _ in
            self.alertCenter.display(message: "Displaying on this view!", time: 1.0, onView: self.view)
        }, for: .touchUpInside)

        displayToastOnWindowBtn.setTitle("Display Toast on Window", for: .normal)
        displayToastOnWindowBtn.addAction(.init { _ in
            self.alertCenter.display(message: "Displaying on the window!", time: 3.0, onView: nil)
        }, for: .touchUpInside)

        displayToastOnWindowWithActionBtn.setTitle("Toast With Action", for: .normal)

        let action = ToastAction(title: "Navigate", action: .init { _ in
            self.navigate()
        })

        displayToastOnWindowWithActionBtn.addAction(.init { _ in
            self.alertCenter.display(message: "Displaying With Action", time: 3.0, onView: self.view, action: action)
        }, for: .touchUpInside)

        displayToastWithActionBtn.setTitle("Toast on Window With Action", for: .normal)

        displayToastWithActionBtn.addAction(.init { _ in
            self.alertCenter.display(message: "Displaying With Action", time: 2.0, onView: nil, action: action)
        }, for: .touchUpInside)


        goToOtherScreenBtn.setTitle("Go to Next Screen", for: .normal)
        goToOtherScreenBtn.addAction(.init { _ in
            self.navigate()
        }, for: .touchUpInside)

        NSLayoutConstraint.activate([
            buttonStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStack.widthAnchor.constraint(equalToConstant: 240),
        ])

        alertCenter.$alertQueue.sink { [weak self] newValue in
            self?.toastsOnQueueLabel.text = "Toasts in Queue: \(newValue.count)"
        }
        .store(in: &cancellables)
    }

    private func navigate() {
        let nextViewController = UIViewController()
        nextViewController.view.backgroundColor = .systemTeal

        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}
