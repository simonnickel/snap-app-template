//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme

struct NavTabSceneList: View {
	
	// TODO: There might be a better way to generalise this scenario. Should not be necessary to get both environment values.
	@EnvironmentObject var destinationFactory: AppDestinationFactory
	@Environment(\.navigationMode) private var navigationMode
	
	/// Wrapping scene to intercept navigationDestination. Needed to manually keep track of selection state for row highlighting.
	private struct WrappedScene: Hashable {
		let scene: AppDestination
	}
	
	@State var tab: AppDestination
	
	@State private var selected: AppDestination?
	
	var body: some View {
		
		ThemeScreenList {
			
			ForEach(tab.subItems) { scene in
				NavigationLink(value: WrappedScene(scene: scene)) {
					ThemeLabel(text: scene.title, icon: scene.icon)
						.labelStyle(.themeListRow())
				}.themeListRow(isSelected: scene == selected)
			}
			
		}
		.navigationDestination(for: WrappedScene.self) { wrapped in
			AnyView(destinationFactory.destination(for: wrapped.scene, in: navigationMode))
				.onAppear {
					selected = wrapped.scene
				}
				.onDisappear {
					selected = nil
				}
		}
		
	}
	
}
