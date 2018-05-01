accessing
makeGroupFor: aSmaCCRHSCollection
	"There is an issue here of not finding out names of rhs."

	| symbol name |
	name := aSmaCCRHSCollection
		inject: ''
		into: [ :sum :each | sum , ' ' , each printString ].
	symbol := self nonTerminalSymbolNamed: '(' , name , ')'.
	symbol isEmpty
		ifTrue: [ (aSmaCCRHSCollection allSatisfy: [ :each | each size = 1 ])
				ifTrue:
					[ aSmaCCRHSCollection do: [ :each | each reduceActionSource: '''1''' ] ].
			aSmaCCRHSCollection do: [ :each | symbol addProduction: each ] ].
	^ symbol