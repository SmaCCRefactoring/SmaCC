accessing
parseCsvStream: aStream withHeader: aBoolean
	| array result header line |
	header := nil.
	result := OrderedCollection new.
	[ aStream atEnd ]
		whileFalse: [ 
			array := self parseCsvLine: aStream nextLine.
			array notNil
				ifTrue: [ 
					aBoolean
						ifTrue: [ 
							header isNil
								ifTrue: [ header := array ]
								ifFalse: [ 
									line := Dictionary new.
									1 to: (header size min: array size) do: [ :i | line at: (header at: i) put: (array at: i) ].
									array size + 1 to: header size do: [ :i | line at: (header at: i) put: nil ].
									result add: line ] ]
						ifFalse: [ result add: array ] ] ].
	^ result