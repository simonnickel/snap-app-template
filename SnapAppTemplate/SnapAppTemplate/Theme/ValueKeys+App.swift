//
//  ValueKeys+App.swift
//  SnapAppTemplate
//
//  Created by Simon Nickel on 03.09.23.
//

import SwiftUI
import SnapTheme

extension Theme.ValueKey {
	
	
	// MARK: - Base overrides
	
	static var definitionsApp: [Theme.ValueKey : Theme.ValueType] {[
		
		:
		
	]}
	
	
	// MARK: - App Keys
	
	public static let allAppKeys: [Theme.ValueKey] = [.exampleValue]
	
	public static let exampleValue = Theme.ValueKey("exampleValue", default: 10)
	
}
