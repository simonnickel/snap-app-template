//
//  NavTabSceneList.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 24.04.23.
//

import SwiftUI
import SnapTheme

struct NavTabSceneList: View {
	
	/// Wrapping scene to intercept navigationDestination. Needed to manually keep track of selection state for row highlighting.
	private struct WrappedScene: Hashable {
		let scene: NavItem
	}
	
	@State var tab: NavItem
	
	@State private var selected: NavItem?
	
	var body: some View {
		
		ThemeSceneList {
			
			ForEach(tab.subItems) { scene in
				NavigationLink(value: WrappedScene(scene: scene)) {
					ThemeLabel(text: scene.title, icon: scene.icon)
						.labelStyle(.themeListRow())
				}.themeListRow(isSelected: scene == selected)
			}
			
		}
		.navigationDestination(for: WrappedScene.self) { wrapped in
			AnyView(wrapped.scene.destination())
				.onAppear {
					selected = wrapped.scene
				}
				.onDisappear {
					selected = nil
				}
		}
		
	}
	
}
