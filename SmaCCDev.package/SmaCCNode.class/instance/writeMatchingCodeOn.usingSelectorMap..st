compiling
writeMatchingCodeOn: aStream usingSelectorMap: aDictionary 
	| matchedItem |
	(action notNil and: [action size > 0]) 
		ifTrue: 
			[matchedItem := aDictionary at: action first ifAbsent: [action asArray].
			aStream nextPutAll: (transitions isEmpty 
						ifTrue: ['^self recordAndReportMatch:']
						ifFalse: ['self recordMatch: ']).
			matchedItem isSymbol 
				ifTrue: [aStream nextPutAll: matchedItem storeString]
				ifFalse: 
					[aStream nextPutAll: '#('.
					matchedItem do: [:each | aStream nextPutAll: each storeString]
						separatedBy: [aStream nextPut: $ ].
					aStream nextPut: $)].
			aStream
				nextPut: $.;
				cr].
	(transitions anySatisfy: [:each | each isCharacterTransition]) 
		ifTrue: 
			[aStream
				nextPutAll: 'self step.';
				cr]