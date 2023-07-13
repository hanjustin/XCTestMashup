![Swift Version](https://img.shields.io/badge/Swift-5.7+-Green)
![Xcode](https://img.shields.io/badge/Xcode-14.2-blue)
![Platform backend](https://img.shields.io/badge/platform-iOS-lightgrey)
![CI Badge](https://github.com/hanjustin/XCTestMashup/actions/workflows/ios.yml/badge.svg)

## Highlights
* [Sample analysis outlining tech choice trade-offs and thought process behind tech decision](https://github.com/hanjustin/Trade-Offs-Analysis/blob/main/001%20-%20Sync%20UI%20%26%20data.%20Notify%20view%20to%20refresh%20when%20Core%20Data%20changes.md)
* [Dependency injection and mocking to utilize XCTest for unit testing](#xctest-unit-testing)
* [Xcode CLI to manage and run tests](#xcode-cli)

## [Tech trade-offs analysis (LINK)](https://github.com/hanjustin/Trade-Offs-Analysis/blob/main/001%20-%20Sync%20UI%20%26%20data.%20Notify%20view%20to%20refresh%20when%20Core%20Data%20changes.md)

<br>

## XCTest unit testing

  * **Core Data:** Improvement of Singleton pattern by creating `testing` static variable.
    ```swift
    struct PersistentStore {
        static var shared: PersistentStore
        static var testing: PersistentStore
    }
    ```

  * **UserDefaults:** Subclass to create mock
    ```swift
    class MockUserDefaults: UserDefaults {
    
    }
    ```
  * **Networking Layer:** Protocol + Mock class
    ```swift
    protocol DataServiceProtocol {

    }
    
    class MockService: DataServiceProtocol {
    
    }
    ```
    
* **Other features**
  * **Test plans**
    * **UnitTests.xctestplan:** Unit tests only
    * **FullTests.xctestplan:** Unit tests + UI test
  * **Code coverage**

## Xcode CLI

1. Build generate Build products & .xctestrun manifest file
   ```
   xcodebuild build-for-testing -scheme XCTestMashup -destination 'platform=iOS Simulator,OS=16.4,name=iPhone 14'
   ```
2. Test using the above generated files to create Result Bundle. (Need to enter path)
   ```
   xcodebuild test-without-building -xctestrun "ENTER_PATH_HERE_FOR_XCTESTRUN Xcode/DerivedData/XCTest_Mashup.xctestrun" -destination 'platform=iOS Simulator,OS=16.4,name=iPhone 14'
   ```
3. Display JSON format of Result Bundle containing Build log, Test report, Code coverage report, Test attachments
   ```
   xcrun xcresulttool get --path ResultBundle.xcresult --format json
   ```

*The above steps could be used as the main steps for CI*

### Other commands:

### Build & Test

```
xcodebuild test -project XCTestMashup.xcodeproj -scheme XCTestMashup -destination 'platform=iOS Simulator,OS=16.4,name=iPhone 14'
```

### Testing on Multiple Destinations
```
xcodebuild test -scheme XCTestMashup -destination 'platform=iOS Simulator,OS=16.4,name=iPhone 14' -destination 'platform=iOS Simulator,OS=16.4,name=iPad (10th generation)'
```

### Produce Result Bundles
```
xcodebuild test -scheme XCTestMashup -resultBundlePath $PWD/testresult/ResultBundle.xcresult -destination 'platform=iOS Simulator,OS=16.4,name=iPhone 14'
```

### Code Coverage Reports with xccov
```
xcrun xccov view --report ResultBundle.xcresult
```
