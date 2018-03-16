//
//  PickerViewRow.swift
//  PickerViewKit
//
//  Created by crelies on 14.03.18.
//  Copyright (c) 2018 Christian Elies. All rights reserved.
//

import Foundation

public protocol PickerViewRowProtocol {
	var type: PickerViewRowType { get }
	var model: PickerViewRowModelProtocol? { get }
	func getView() -> UIView
}

public extension PickerViewRowProtocol {
	func getView() -> UIView {
		switch type {
			case .plain(let title):
				let label = UILabel()
				label.text = title
				return label
			case .attributed(let title):
				let label = UILabel()
				label.attributedText = title
				return label
			case .custom(let view):
				return view()
		}
	}
}

public struct PickerViewRow: PickerViewRowProtocol {
	public var type: PickerViewRowType
	public var model: PickerViewRowModelProtocol?
	
	public init(type: PickerViewRowType) {
		self.type = type
	}
	
	public init(type: PickerViewRowType, model: PickerViewRowModelProtocol) {
		self.type = type
		self.model = model
	}
}
