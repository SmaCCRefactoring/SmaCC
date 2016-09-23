parsing
removeQuotesAround: aString
	aString isEmpty
		ifTrue: [ ^ aString ].
	aString first = $'
		ifTrue:
			[ ^ (aString copyFrom: 2 to: aString size - 1)
				copyReplaceAll: ''''''
				with: '''' ].
	aString first = $"
		ifTrue:
			[ ^ (aString copyFrom: 2 to: aString size - 1)
				copyReplaceAll: '""'
				with: '"' ].
	^ aString