private
keywords
	^ keywords
		ifNil:
			[ keywords := #('return' 'public' 'private' 'super' 'throw' 'null' 'else')
				asSet ]