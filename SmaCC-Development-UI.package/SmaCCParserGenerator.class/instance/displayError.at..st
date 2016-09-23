private
displayError: aString at: position
	self textWidget
		ifNotNil:
			[ :each | 
			each
				text: (each text copyFrom: 1 to: position - 1) , aString , ' ->' , (each text copyFrom: position to: each text size).
			each setSelection: (position to: position + aString size + 2) ]