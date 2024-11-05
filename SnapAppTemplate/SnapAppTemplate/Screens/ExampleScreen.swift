//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapDependencies

struct ExampleScreen: View {
	
	@Environment(\.theme) private var theme
	@Dependency(\.dataSource) private var dataSource
	@Environment(Navigator.self) private var navigator
	
	let destination: AppDestination
	
	var body: some View {
		
		ThemeScreen {
			
			VStack {
				
				Text(destination.definition.title + " Screen")
				Text(dataSource.content)
				
				Button(action: {
					navigator.present(destination: .circle)
				}, label: {
					ThemeLabel(text: "Push .circle", style: .themeButtonPrimary)
				})
				.buttonStyle(.themePrimary)
				
			}
	
		}
		
	}
	
}


// MARK - Preview

#Preview {
	
	NavigationStack {
		
		ExampleScreen(destination: .rectangleA)
		
	}
	
}
