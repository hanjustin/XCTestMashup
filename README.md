![Swift Version](https://img.shields.io/badge/Swift-5.7+-Green)
![Xcode](https://img.shields.io/badge/Xcode-14.2-blue)
![Platform backend](https://img.shields.io/badge/platform-iOS-lightgrey)
![CI Badge](https://github.com/hanjustin/XCTestMashup/actions/workflows/ios.yml/badge.svg)

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
