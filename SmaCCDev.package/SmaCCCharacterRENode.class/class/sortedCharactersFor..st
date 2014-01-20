private
sortedCharactersFor: aString 
	| characters stream |
	stream := WriteStream with: String new.
	SmaCCGrammar ignoreCase 
		ifTrue: 
			[aString do: 
					[:each | 
					stream
						nextPut: each asUppercase;
						nextPut: each asLowercase]]
		ifFalse: [stream nextPutAll: aString].
	characters := stream contents 
				asSortedCollection: [:a :b | a asInteger < b asInteger].
	stream := WriteStream with: String new.
	characters inject: nil
		into: 
			[:sum :each | 
			sum = each ifFalse: [stream nextPut: each].
			each].
	^stream contents