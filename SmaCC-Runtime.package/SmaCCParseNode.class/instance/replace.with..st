private
replace: originalSmaCCParseNode with: newSmaCCParseNode
	SmaCCParseNode instSize + 1 to: self class instSize do: [ :i | 
		| each |
		each := self instVarAt: i.
		each == originalSmaCCParseNode
			ifTrue: [ self instVarAt: i put: newSmaCCParseNode ]
			ifFalse: [ 
				(each isKindOf: SequenceableCollection)
					ifTrue: [ 
						each
							keysAndValuesDo: [ :index :value | 
								value == originalSmaCCParseNode
									ifTrue: [ each at: index put: newSmaCCParseNode ] ] ] ] ].
	self completeSource
		ifNotNil: [ :source | 
			source
				replaceFrom: originalSmaCCParseNode startPosition
				to: originalSmaCCParseNode stopPosition
				with: newSmaCCParseNode source ].
	newSmaCCParseNode parent: self