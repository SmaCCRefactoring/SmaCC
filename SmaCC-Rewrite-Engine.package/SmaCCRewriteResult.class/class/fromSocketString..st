instance
fromSocketString: aString
	| result |
	result := self new.
	aString
		splitFirstOn: (Character value: 0)
		andThen: $=
		do:
			[:key :value | 
			key = 'FILENAME' ifTrue: [result filename: value].
			key = 'ERRORSTRING' ifTrue: [result errorString: value].
			key = 'TYPE' ifTrue: [result type: value asSymbol].
			key = 'STARTLINE' ifTrue: [result startLine: (Number fromString: value)].
			key = 'STARTCOLUMN' ifTrue: [result startColumn: (Number fromString: value)].
			key = 'INTERVAL'
				ifTrue:
					[| items |
					items := value subStrings: $-.
					result interval: ((Number fromString: items first) to: (Number fromString: items last))].
			key = 'TRANSFORMATION' ifTrue: [result transformation: value]].
	^result