//
//  AppDestinationFactory.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 27.05.24.
//

import SwiftUI
import SnapMatchingNavigation

protocol NavigationDestinationFactory {

	@MainActor
	func destination(for navItem: AppDestination, in mode: MNavContainer.Mode) -> any View
		
}

extension AppDependencies: NavigationDestinationFactory {
	
	@MainActor
	func destination(for navItem: AppDestination, in mode: MNavContainer.Mode) -> any View {
		
		let destination = AnyView(destinationBase(for: navItem, in: mode))
			.if(unwrap: navItem.title, transform: { view, title in
				view.navigationTitle(title)
			})
		
		return switch mode {
				
			case .tab: destination
#if !os(macOS)
					.if(NavItem.tabsAvailable.contains(self)) { view in
						view.toolbar {
							ToolbarItem(placement: .topBarLeading) {
								ToolbarButtonSettings()
									.buttonStyle(.themeNavbar)
							}
						}
					}
#endif
				
			case .split: destination
				
		}
	}
	
	@MainActor
	private func destinationBase(for navItem: AppDestination, in mode: MNavContainer.Mode) -> any View {
		switch navItem {
				
			case .rectangleA: ExampleScreen(item: navItem)
			case .rectangleB: ExampleScreen(item: navItem)
				
			case .circleA: ExampleScreen(item: navItem)
				
			case .triangle: ExampleScreen(item: navItem)
				
			default: AnyView(destinationDefault(for: navItem, in: mode))
				
		}
	}
	
	/// Attention: If it has a single subitem, its destination is displayed directly, be careful when checking for self in `destination(for:)`, the single subitem will never go through it.
	@MainActor
	private func destinationDefault(for navItem: AppDestination, in mode: MNavContainer.Mode) -> any View {
		if navItem.subItems.count > 1 {
			NavTabSceneList(tab: navItem)
		} else if navItem.subItems.count == 1, let item = navItem.subItems.first {
			destination(for: item, in: mode)
		} else {
			Text("No sub items defined.")
		}
	}
	
}
