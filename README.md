# HCaptchaSwift

A lightweight implementation of hCaptcha for use in server-side Swift applications. As opposed to the official [HCaptcha-ios-sdk](https://github.com/hCaptcha/HCaptcha-ios-sdk), this package does not depend on WKWebView or any other UI-layer elements and instead merely implements the backend verification part of HCaptcha.

## Add the package

Only SwiftPM is supported at this time.

To add the package, simply select `File` / `Add Packages...` in Xcode and paste this URL into the search / url box: `https://github.com/aronbudinszky/hcaptcha-swift` .

## Usage

- Note: this is intended for server-side Swift use. If you are building an iOS or macOS app just use the official [HCaptcha-ios-sdk](https://github.com/hCaptcha/HCaptcha-ios-sdk).

### Step 1

You should display the HCaptcha widget on your site via the [standard documented methods](https://docs.hcaptcha.com/?utm_source=docs3#add-the-hcaptcha-widget-to-your-webpage) and/or one of the frontend wrappers/plugins.

This will generate a token client side which you can then submit and verify server-side.

### Step 2

Once you've generated the client-side widget, use this package to easily verify the token it generated via any chosen server-side Swift solution (for example [Vapor](https://vapor.codes)) like so:

```
        // Create the client
        let hCaptchaClient = HCaptchaSwift.Client(secret: "- your secret token -")

        // Now try to verify
        let response = try await hCaptchaClient.verify("- verification token you received when the user completed the captcha -", remoteip: "- user's remote ip (optional) -", sitekey: "- your site key (optional, but recommended)")
        // - Note: In case of any errors (including when verification fails) the returned hCaptcha error codes will be thrown (see docs). But generally non-spam users won't be sending invalid verification tokens anyway (unless your implementation is weird / wrong), so regular users won't see these errors.

        guard response else {
            print("Verification failed.")
            // This usually won't happen, but good to check just in case. Typically an error should already be thrown above if this is false. (Unfortunately hCaptcha docs are a bit unclear on this.)
            return
        }
        
        print("Yay! You are not a bot!")
```
