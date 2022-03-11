#  Heap for SwiftUI on iOS

*Heap is a modern take on analytics.* There's no need to ship event tracking code, no need to wait days or weeks for data to accumulate, no need to muddle your codebase, and no need to fumble with rigid reports.

For the first time, meaningful product questions can be answered just as soon as they're asked.

See `CHANGELOG.md` for what's new.

# Installation

For this alpha release, Heap.xcframework and Heap_SwiftUI.xcframework need to be installed manually.

  1. Drag `Heap.xcframework` and `Heap_SwiftUI.xcframework` into your XCode project. Make sure to select *Copy items if needed* and add the framework to your app targets.
  2. Click on the project (blue project icon), and select "General".
  3. Within General, find "Heap.xcframework" and "Heap_SwiftUI.xcframework" in the "Frameworks, Libraries, and Embedded Content" section and change it to from "Do Not Embed" to "Embed & Sign".
  4. Initialize Heap with your app ID using `Heap.initializeForSwiftUI("YOUR_APP_ID")`

If targetting iOS 14 and above, you can initialize Heap within an app delegate, e.g.

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

The Event Visualizer can also be registered though the process outlined at https://developers.heap.io/docs/ios#step-1-register-the-url-type.

If you’re using an App as your main entry point, you will need to use the onOpenURL modifier, e.g.:

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
