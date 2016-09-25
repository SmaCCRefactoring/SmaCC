instance creation
fromSocketString: aString
	| result |
	result := self new.
	aString
		splitFirstOn: (Character value: 0)
		andThen: $=
		do:
			[ :key :value | 
			key = 'FILENAME'
				ifTrue: [ result filename: value ].
			key = 'ERRORSTRING'
				ifTrue: [ result errorString: value ].
			key = 'TYPE'
				ifTrue: [ result type: value asSymbol ].
			key = 'STARTLINE'
				ifTrue: [ result startLine: value asNumber ].
			key = 'STARTCOLUMN'
				ifTrue: [ result startColumn: value asNumber ].
			key = 'INTERVAL'
				ifTrue:
					[ | items |
					items := value substrings: $- asString.
					result interval: (items first asNumber to: items last asNumber) ].
			key = 'TRANSFORMATION'
				ifTrue: [ result transformation: value ] ].
	^ result