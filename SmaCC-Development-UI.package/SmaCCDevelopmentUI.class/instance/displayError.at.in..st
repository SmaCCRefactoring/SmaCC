private
displayError: aString at: position in: aTextModel
	| text |
	text := aTextModel text.
	aTextModel
		setText:
			(text first: position - 1)
				, (Text string: aString , '->' attribute: TextEmphasis bold)
				, (text last: text size - position + 1).
	aTextModel
		setPrimarySelectionInterval: (position to: position + aString size + 1)