> This repository is part of the [SNAP](https://github.com/simonnickel/snap) suite.


# SnapAppTemplate

An Xcode project with a base setup of [SNAP](https://github.com/simonnickel/snap). The app comes with structure, navigation and infrastructure prepared, to quickly setup a new app using the SNAP packages.

Also have a look at [snap-template-shared](https://github.com/simonnickel/snap-template-shared) for shared features and implementations.


## Motivation

> Finishing the last 20% of a project takes 80% of the time.
>
> (Source: Someone on the internet)

The goal of SnapTemplate is to already have the last 20% ready, before you even start the project. Even if you don't plan to finish it, testing a quick idea is much better with a full app experience around it.


## Create new App

1. Create and clone repository.
2. Copy files from snap-app-template.
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

Enabled Strict Concurrency checking in build settings to prepare for changes Swift 6:

`SWIFT_STRICT_CONCURRENCY = complete;`
