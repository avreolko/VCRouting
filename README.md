# VCRouting
The primary goal of this framework is to provide a set of rules for routing in an iOS application.
Basically, `Module` and `IRouting` are abstractions for `UIViewController`.

## Installation
Install with SPM 📦

## Usage
Personally, I like to use a factory that contains specific details about my modules.
```swift
enum ModuleSeed {
    case auth(outputHandler: (Result<AuthToken, Error>) -> Void)
}

struct AuthAssembly: IModuleAssembly {

    let moduleIO: ModuleIO<None, Result<AuthToken, Error>>

    func makeModule() -> Module {
        return Module(viewController: UIViewController())
    }
}

struct ModuleBuildersFactory {

    typealias ModuleBuilder = () -> Module

    func makeModuleBuilder(for key: ModuleSeed) -> ModuleBuilder {
        switch key {
            case .auth(let outputHandler): return {
                let io = ModuleIO(inputData: None(), outputHandler: outputHandler)
                let assembly = AuthAssembly(moduleIO: io)
                return assembly.makeModule()
            }
        }
    }
}
```
