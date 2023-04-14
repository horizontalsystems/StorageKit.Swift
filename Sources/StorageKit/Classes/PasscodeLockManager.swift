import LocalAuthentication

class PasscodeLockManager {
    weak var delegate: IKeychainKitDelegate?

    private(set) var state: PasscodeLockState = .passcodeSet

    func handleLaunch() {
        state = resolveState()

        switch state {
        case .passcodeNotSet: delegate?.onSecureStorageInvalidation()
        default: ()
        }
    }

    func handleForeground() {
        let oldState = state

        state = resolveState()

        guard state != oldState else {
            return
        }

        switch state {
        case .passcodeSet:
            delegate?.onPasscodeSet()
        case .passcodeNotSet:
            delegate?.onPasscodeNotSet()
            delegate?.onSecureStorageInvalidation()
        case .unknown:
            delegate?.onCannotCheckPasscode()
        }
    }

    private func resolveState() -> PasscodeLockState {
        var error: NSError?

        if LAContext().canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
            return .passcodeSet
        }

        if let error = error as? LAError {
            switch error.code {
            case LAError.passcodeNotSet: return .passcodeNotSet
            default: ()
            }
        }

        return .unknown
    }

}
