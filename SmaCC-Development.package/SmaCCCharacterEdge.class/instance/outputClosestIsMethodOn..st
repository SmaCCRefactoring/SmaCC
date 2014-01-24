compiling
outputClosestIsMethodOn: aStream 
	| expr |
	expr := self closestIsExpression.
	expr isNil ifFalse: [aStream nextPutAll: 'currentCharacter ' , expr].
	^expr