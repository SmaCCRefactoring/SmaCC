private
operators
	^ operators
		ifNil:
			[ operators := #('OR' 'AND' 'XOR' ',' '+' '-' 'DIV' 'MOD' 'SHL' 'SHR' '*' '/' '@' '.' '^')
				asSet ]