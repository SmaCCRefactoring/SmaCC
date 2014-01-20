private
displayError: aString at: position notifying: aRequestor 
	aRequestor selectFrom: position to: position - 1.
	aRequestor
		replaceSelectionWith: (Text string: aString , '->' attribute: TextEmphasis bold).
	aRequestor
		setSelection: (position to: position + aString size + 1)