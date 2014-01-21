compiling
writeMatchingCodeFor: aSmaCCNode
	| matchedItem |
	(aSmaCCNode action notNil and: [aSmaCCNode action size > 0])
		ifTrue:
			[matchedItem := aSmaCCNode action asArray.
			self codeStream
				nextPutAll: (aSmaCCNode transitions isEmpty ifTrue: ['^self recordAndReportMatch:'] ifFalse: ['self recordMatch: ']).
			matchedItem isSymbol
				ifTrue: [self codeStream nextPutAll: matchedItem storeString]
				ifFalse:
					[self codeStream nextPutAll: '#('.
					matchedItem do: [:each | self codeStream nextPutAll: each storeString] separatedBy: [self codeStream nextPut: $ ].
					self codeStream nextPut: $)].
			(self codeStream)
				nextPut: $.;
				cr].
	(aSmaCCNode transitions anySatisfy: [:each | each isCharacterTransition]) ifTrue: [self nextPutLine: 'self step.']