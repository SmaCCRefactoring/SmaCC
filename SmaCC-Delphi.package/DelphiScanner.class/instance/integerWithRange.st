private
integerWithRange
	stream skip: -2.
	matchEnd := matchEnd - 2.
	matchActions := Array with: self numberId.
	^ self
		createTokenFor:
			(outputStream
				skip: -2;
				contents)