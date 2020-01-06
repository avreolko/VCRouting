# VCRouting
Primary goal of this small framework is to provide set of rules for routing in iOS application.
Basically `Module` and `IRouting` is an abstractions for `UIViewController`.

## How to get started
Personally I like the approach with factory that contains particular details about my modules.
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

## Installation
VCRouting supports installation through `Carthage`.
[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate VCRouting into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "avreolko/VCRouting" >= 0.1
```

Run `carthage` to build the framework and drag the built `VCRouting.framework` into your Xcode project.
