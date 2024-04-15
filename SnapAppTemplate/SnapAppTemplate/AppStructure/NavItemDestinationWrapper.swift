//
//  NavItemDestinationWrapper.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 10.01.24.
//

import SwiftUI
import SnapMatchingNavigation

extension NavItem {
	
	func destination(for mode: MNavContainer.Mode) -> any View {
		return destinationBase(for: mode)
		// A place to adjust all destinations.
	}
	
}

struct NavItemDestinationWrapper: View {
	
	//	@Environment(\.dataSource) private var dataSource
	
	let navItem: NavItem
	
	var body: some View {
		switch navItem {
				
			case .rectangleA: ExampleScreen(item: navItem)
			case .rectangleB: ExampleScreen(item: navItem)
				
			case .circleA: ExampleScreen(item: navItem)
				
			case .triangle: ExampleScreen(item: navItem)
				
			default: AnyView(navItem.destinationDefault())
				
		}
	}
	
}
