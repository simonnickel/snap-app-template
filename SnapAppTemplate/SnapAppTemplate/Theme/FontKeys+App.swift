//
//  FontKeys+App.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

extension Theme.FontKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.FontKey : Theme.FontValue] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.FontKey] = [.exampleFont]
	
	public static let exampleFont = Theme.FontKey("exampleFont", default: .definition(.init(size: 10, weight: .thin)))
	
}
