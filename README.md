<!-- Copy badges from SPI -->
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-app-template%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/simonnickel/snap-app-template)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fsimonnickel%2Fsnap-app-template%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/simonnickel/snap-app-template) 

> This package is part of the [SNAP](https://github.com/simonnickel/snap-abstract) suite.


# SnapAppTemplate

An Xcode project with a base setup of [SNAP](https://github.com/simonnickel/snap-abstract). The app comes with structure, navigation and infrastructure prepared, to quickly setup a new app using the SNAP packages.

Also have a look at [snap-template-shared](https://github.com/simonnickel/snap-template-shared) for shared features and implementations.

[![Documentation][documentation badge]][documentation] 

[documentation]: https://swiftpackageindex.com/simonnickel/snap-app-template/main/documentation/snapapptemplate
[documentation badge]: https://img.shields.io/badge/Documentation-DocC-blue


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
4. Provides a base settings screen with some theme configuration options. 

<img src="/screenshot.png" height="400">
<img src="/screenshot-settings.png" height="400">
