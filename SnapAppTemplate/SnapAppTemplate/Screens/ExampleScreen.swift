//
//  SNAP - https://github.com/simonnickel/snap
//  Created by Simon Nickel
//

import SwiftUI
import SnapTheme
import SnapDependencies

// TODO: See ToolbarButtonSettings below
import SnapTemplateSettings

struct ExampleScreen: View {
	
	@Environment(\.theme) private var theme
	@Dependency(\.dataSource) private var dataSource
	@Environment(Navigator.self) private var navigator
	
	let destination: AppDestination
	
	var body: some View {
		
        ThemeScreen(style: .plain) {
            
            List {

                Section {
                    
                    Text(dataSource.content)
                        .themeListRow()
                    
                    Navigator.ListRow(destination: .rectangle)
                    
                } header: {
                    
                    Text(destination.definition.title + " Screen")
                        .theme(font: .listHeader)
                    
                } footer: {
                    
                    ThemeVStack(spacing: .spacingElements) {
                        Button(action: {
                            navigator.present(destination: .circle)
                        }, label: {
                            ThemeLabel(text: "Push .circle", style: .themeButtonPrimary)
                        })
                        .buttonStyle(.themePrimary)
                        
                        // TODO: Should be part of the template and in the navigationbar.
                        ToolbarButtonSettings()
                    }
                    .theme(padding: .spacingGroups, [.vertical, .trailing])
                    .frame(maxWidth: .infinity)
                    
                }
	
			}
	
		}
		
	}
	
}


// MARK: - Preview

import SnapNavigation

#Preview {
	
    // TODO: Provide simple Container with all environment set up. Or provide default value for EnvironmentObject Navigator.
    SnapNavigationPreview(provider: AppNavigationProvider(), scene: .main)
	
}
