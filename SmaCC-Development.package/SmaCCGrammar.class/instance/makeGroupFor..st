accessing
makeGroupFor: aSmaCCRHSCollection 
	| symbol name |
	name := aSmaCCRHSCollection inject: ''
				into: [:sum :each | sum , ' | ' , each printString].
	symbol := self nonTerminalSymbolNamed: 'Group: ' , name.
	symbol isEmpty 
		ifTrue: 
			[(aSmaCCRHSCollection allSatisfy: [:each | each size = 1]) 
				ifTrue: [aSmaCCRHSCollection do: [:each | each reduceAction: '''1''']].
			aSmaCCRHSCollection do: [:each | symbol addProduction: each]].
	^symbol