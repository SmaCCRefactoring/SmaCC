inspector
formatText: text matched: isMatched
	isMatched isNil
		ifTrue: [ text addAttribute: (TextColor new color: Color lightGray) ]
		ifFalse: [ isMatched
				ifFalse: [ text
						addAttribute: (TextColor new color: Color red);
						allBold ] ]