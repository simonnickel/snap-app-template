//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTemplateShared
import SnapMatchingNavigation

class AppDestinationFactory: NavigationDestinationFactory, ObservableObject {
	
	let dependencies: AppDependencies
	
	init(dependencies: AppDependencies) {
		self.dependencies = dependencies
	}
	
	typealias DestinationType = AppDestination
	
	@MainActor
	func destination(for destination: DestinationType, in mode: MNavContainer.Mode) -> any View {
		
		let destinationView = AnyView(destinationBase(for: destination, in: mode))
			.if(unwrap: destination.title, transform: { view, title in
				view.navigationTitle(title)
			})
		
		return switch mode {
				
			case .tab: destinationView
#if !os(macOS)
					.if(AppDestination.tabsAvailable.contains(destination)) { view in
						view.toolbar {
							ToolbarItem(placement: .topBarLeading) {
								ToolbarButtonSettings()
									.buttonStyle(.themeNavbar)
							}
						}
					}
#endif
				
			case .split: destinationView
				
		}
	}
	
	@MainActor
	private func destinationBase(for destination: AppDestination, in mode: MNavContainer.Mode) -> any View {
		switch destination {
				
			case .rectangleA: ExampleScreen(item: destination)
			case .rectangleB: ExampleScreen(item: destination)
				
			case .circleA: ExampleScreen(item: destination)
				
			case .triangle: ExampleScreen(item: destination)
				
			default: AnyView(destinationDefault(for: destination, in: mode))
				
		}
	}
	
	/// Attention: If it has a single subitem, its destination is displayed directly, be careful when checking for self in `destination(for:)`, the single subitem will never go through it.
	@MainActor
	private func destinationDefault(for destination: AppDestination, in mode: MNavContainer.Mode) -> any View {
		if destination.subItems.count > 1 {
			NavTabSceneList(tab: destination)
		} else if destination.subItems.count == 1, let item = destination.subItems.first {
			self.destination(for: item, in: mode)
		} else {
			Text("No sub items defined.")
		}
	}
	
}
