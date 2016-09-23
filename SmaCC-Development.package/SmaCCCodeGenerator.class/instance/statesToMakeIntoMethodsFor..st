compiling-scanner
statesToMakeIntoMethodsFor: aSmaCCNode
	| methodStates |
	methodStates := self initialMethodStatesFor: aSmaCCNode.
	self splitLargeNodes: methodStates.
	^ methodStates asSortedCollection: [ :a :b | a id < b id ]