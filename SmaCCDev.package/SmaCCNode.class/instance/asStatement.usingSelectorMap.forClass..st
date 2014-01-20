compiling
asStatement: methodMap usingSelectorMap: aDictionary forClass: aClass 
	| stream |
	stream := WriteStream with: String new.
	self hasSimpleLoop ifTrue: [stream nextPut: $[].
	self writeMatchingCodeOn: stream usingSelectorMap: aDictionary.
	(self sortedTransitionsFor: aClass) do: 
			[:each | 
			each to = self 
				ifTrue: 
					[stream
						nextPutAll: each expression;
						nextPut: $];
						nextPutAll: ' whileTrue.';
						cr]
				ifFalse: 
					[stream
						nextPutAll: each expression;
						nextPutAll: ' ifTrue: ['.
					stream
						nextPutAll: (methodMap at: each to
									ifAbsentPut: 
										[each to 
											asStatement: methodMap
											usingSelectorMap: aDictionary
											forClass: aClass]);
						nextPutAll: '].';
						cr]].
	(transitions notEmpty or: [action isNil]) 
		ifTrue: 
			[stream
				nextPutAll: '^self reportLastMatch';
				cr].
	^stream contents