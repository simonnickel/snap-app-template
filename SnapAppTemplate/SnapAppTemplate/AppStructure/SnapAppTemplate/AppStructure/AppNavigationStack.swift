//
//  AppNavigationStack.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 27.05.24.
//

import SwiftUI
import SnapMatchingNavigation

struct AppNavigationStack: View {
	
	@Environment(\.destinationFactory) var destinationFactory: NavigationDestinationFactory
	
	let root: NavItem
	let mode: MNavContainer.Mode
	
	var body: some View {
		NavigationStack {
			
			AnyView(destinationFactory.destination(for: root, in: mode))
				.navigationDestination(for: NavItem.self) { scene in
					AnyView(destinationFactory.destination(for: scene, in: mode))
				}
			
		}
	}
	
}
