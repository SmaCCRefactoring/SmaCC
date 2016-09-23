private
splitWithAction: anInteger
	| previousToken previousState |
	previousState := currentState.
	previousToken := currentToken.
	[ currentState := self duplicateState.
	self performAction: anInteger.
	currentToken notNil
		ifTrue: [ self performParsingStep ] ]
		ensure: [ self restoreState: previousState.
			currentToken := previousToken ]