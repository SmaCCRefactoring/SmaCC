tests
testInsertWhitespace
	| string |
	string := SmaCCString
		on:
			'1' , (String with: Character cr with: Character lf) , '2'
				, (String with: Character cr) , '3' , (String with: Character lf)
				, '4' , (String with: Character lf) , (String with: Character cr)
				, '5' , (String with: Character lf).
	string addNewLineWhitespace: ' ' from: 1 to: string size.
	self
		assert:
			string asString
				=
					('1' , (String with: Character cr with: Character lf) , ' 2'
						, (String with: Character cr) , ' 3'
						, (String with: Character lf) , ' 4'
						, (String with: Character lf) , ' '
						, (String with: Character cr) , ' 5'
						, (String with: Character lf) , ' ')