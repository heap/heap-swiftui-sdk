***
:warning: **Due to breaking changes in iOS 16, we do not yet recommend using this SDK in production.** The [Heap iOS SDK](https://github.com/heap/heap-ios-sdk) _is_ compatible with iOS 16 when autocapturing UIKit events and precision manual tracking.
***

# Heap for SwiftUI on iOS

*Heap is a modern take on analytics.* There's no need to ship event tracking
code, no need to wait days or weeks for data to accumulate, no need to muddle
your codebase, and no need to fumble with rigid reports.

For the first time, meaningful product questions can be answered just as soon
as they're asked.

See `CHANGELOG.md` for what's new.

## Installation

For this alpha release, Heap.xcframework and Heap_SwiftUI.xcframework need to
be installed from Swift Package Manager.

1. Use Swift Package Manager to add `https://github.com/heap/heap-ios-sdk.git`
   version `9.0.0-alpha.2` to your app project.
2. Use Swift Package Manager to add
   `https://github.com/heap/heap-swiftui-sdk.git` version `0.0.0-alpha.4` to
   your app project.
3. Initialize Heap with your app ID using
   `Heap.initializeForSwiftUI("YOUR_APP_ID")`

If targetting iOS 14 and above, you can initialize Heap within an app delegate:

```swift
@main
struct MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        ...
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        Heap.initializeForSwiftUI("YOUR_APP_ID")
        return true
    }
}
```

The Event Visualizer can also be registered though the process outlined at
https://developers.heap.io/docs/ios#step-1-register-the-url-type.

If you’re using an App as your main entry point, you will need to use the
`onOpenURL` modifier:

```swift
var body: some Scene {
    WindowGroup {
        ContentView()
            .environmentObject(model)
            .onOpenURL { url in
                Heap.handleOpen(url, options: [:])
            }
    }
}
```
