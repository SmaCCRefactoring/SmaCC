accessing
defaultTokenNameFor: aString
	| stream string |
	stream := WriteStream on: String new.
	aString
		do:
			[ :each | 
			| value |
			value := self tokenNameMap at: each ifAbsent: [ each ].
			value isString
				ifTrue:
					[ stream
						nextPutAll:
							(stream position = 0
								ifTrue: [ value ]
								ifFalse: [ value capitalized ]) ]
				ifFalse: [ stream
						nextPut:
							(value isAlphaNumeric
								ifTrue: [ value ]
								ifFalse: [ $_ ]) ] ].
	string := stream contents.
	string first isDigit
		ifTrue: [ string := '_' , string ].
	string first isUppercase
		ifTrue: [ string at: 1 put: string first asLowercase ].
	^ string , 'Token'