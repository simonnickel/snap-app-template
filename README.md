> [!CAUTION]
> This repository no longer active, have a look into the SnapTemplateDemo project in [snap-template](https://github.com/simonnickel/snap-template).


# SnapAppTemplate

An Xcode project with a base setup of [SNAP](https://github.com/simonnickel/snap). The app comes with structure, navigation and infrastructure prepared, to quickly setup a new app using the SNAP packages.

Also have a look at [snap-template](https://github.com/simonnickel/snap-template) for shared features and implementations.


## Motivation

> Finishing the last 20% of a project takes 80% of the time.
>
> (Source: Someone on the internet)

The goal of SnapTemplate is to already have the last 20% ready, before you even start the project. The same applies to the first 20% of a project: infrastructure, boilerplate and project setup. 

Even if you don't plan to finish the last 60% of it, it allows to test a quick idea with a full app experience around it.


## Create new App

1. Create and clone repository.
2. Copy files from snap-app-template and get everything in the correct place.
3. Rename project.
    1. Rename top item in project navigator.
    2. Change bundle identifier.
4. Follow setup steps of [snap-settings-service](https://github.com/simonnickel/snap-settings-service#setup).


## Template

The Template comes with:
 
1. Infrastructure to define dependencies and has the SNAP packages ready to go.
2. A setup to define a navigation hierarchy for the app.
3. Uses [snap-matching-navigation](https://github.com/simonnickel/snap-matching-navigation) to show a Sidebar on macOS / iPadOS and a Tabbar on iOS.
4. A base settings screen using [snap-settings-service](https://github.com/simonnickel/snap-settings-service) with some theme configuration options. 

<img src="/screenshot.png" height="400">
<img src="/screenshot-settings.png" height="400">


## Configurations

### Info.plist

Added `ITSAppUsesNonExemptEncryption` key with value `NO`, see: [Complying with Encryption Export Regulations](https://developer.apple.com/documentation/security/complying_with_encryption_export_regulations)

### Build Settings

 - Set `Swift Language Version` to 6
 - Enabled Strict Concurrency checking: `SWIFT_STRICT_CONCURRENCY = complete;`


## // TODO:  

- Settings Screen
    - Settings Header
    - Contact
- Generic Usage Statistics
- SwiftData with sync
- Widgets using SwiftData (display, edit)
- Release Notes
- Multiple windows
