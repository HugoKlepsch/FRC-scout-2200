//
//  TextEntryWithLabel.swift
//  FRC-scout-2200
//
//  Created by Hugo Klepsch on 2023-12-23.
//

import SwiftUI

public typealias ValueValidator = (String) -> Bool

public let numericValidator: ValueValidator = { value in
    if value.isEmpty {
        return true
    } else {
        let parsedInt = Int(value)
        return parsedInt != nil
    }
}

struct TextEntryWithLabel<FocusType: Hashable>: View {
    private var hint: String
    @Binding private var text: String
    private var numeric: Bool = false
    private var validator: ValueValidator?
    private var focused: FocusState<FocusType>.Binding
    private var focusValue: FocusType
    
    init(hint: String, text: Binding<String>, numeric: Bool = false, focusVar: FocusState<FocusType>.Binding,
         focusValue: FocusType, validator: @escaping ValueValidator = {_ in return true}) {
        self.hint = hint
        // Underscore prefix is odd, see this link for details: https://stackoverflow.com/a/56975728
        _text = text
        self.numeric = numeric
        self.validator = validator
        self.focused = focusVar
        self.focusValue = focusValue
    }
    
    var hintStyle: some ShapeStyle {
        if text.isEmpty {
            return Color(.placeholderText)
        } else {
            var localValidator: ValueValidator = emptyValidator
            if let validator {
                localValidator = validator
            }
            if localValidator(text) {
                return text.isEmpty ? Color(.placeholderText) : .accentColor
            } else {
                return Color(.red)
            }
        }
    }
    
    private func emptyValidator(_: String) -> Bool {
        return true
    }
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(hint)
                .foregroundStyle(hintStyle)
                .offset(y: text.isEmpty ? 0 : -25)
                .scaleEffect(text.isEmpty ? 1.0 : 0.8, anchor: .leading)
            TextField("", text: $text)
                .keyboardType(numeric ? .numberPad : .default)
                .focused(focused, equals: focusValue)
        }
        .padding(.top, text.isEmpty ? 0 : 15)
        .animation(.spring(), value: text.isEmpty)
    }
}

#Preview("Numeric empty") {
    @State var variable = ""
    @FocusState var focused: Bool
    return Form {
        TextEntryWithLabel(hint: "My Label", text: $variable, numeric: true, focusVar: $focused, focusValue: true,
                           validator: numericValidator)
    }
}

#Preview("Numeric") {
    @State var variable = "2200"
    @FocusState var focused: Bool
    return Form {
        TextEntryWithLabel(hint: "My Label", text: $variable, numeric: true, focusVar: $focused, focusValue: true,
                           validator: numericValidator)
    }
}

#Preview("Not numeric empty") {
    @State var variable = ""
    @FocusState var focused: Bool
    return Form {
        TextEntryWithLabel(hint: "My Label", text: $variable, numeric: false, focusVar: $focused, focusValue: true)
    }
}

#Preview("Not numeric") {
    @State var variable = "Not numberic"
    @FocusState var focused: Bool
    return Form {
        TextEntryWithLabel(hint: "My Label", text: $variable, numeric: false, focusVar: $focused, focusValue: true)
    }
}
