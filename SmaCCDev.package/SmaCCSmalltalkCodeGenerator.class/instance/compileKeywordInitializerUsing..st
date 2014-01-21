compiling
compileKeywordInitializerUsing: keywordMapDictionary
	| stream dataStream |
	keywordMapDictionary isEmpty ifTrue: [^self].
	stream := WriteStream with: String new.
	stream nextPutAll: 'initializeKeywordMap'.
	stream nextPutAll: ' keywordMap :=  Dictionary new. '.
	dataStream := WriteStream with: Array new.
	keywordMapDictionary
		keysAndValuesDo:
			[:key :value | 
			value keys asSortedCollection
				do:
					[:each | 
					dataStream
						nextPut:
							(Array
								with: key
								with: each
								with: (value at: each))]].
	stream
		nextPutAll: '#(';
		cr.
	dataStream contents
		do:
			[:each | 
			stream nextPutAll: '#('.
			each do: [:item | item storeOn: stream] separatedBy: [stream nextPut: $ ].
			stream nextPut: $)]
		separatedBy: [stream cr].
	stream nextPut: $).
	stream
		nextPutAll:
			' do: [:each | (keywordMap at: each first ifAbsentPut: [Dictionary new]) at: (each at: 2) put: each last]. ^keywordMap'.
	scannerClass metaclass
		compile: (SmalltalkParser parseMethod: stream contents) formattedCode
		classified: #'generated-initialization'