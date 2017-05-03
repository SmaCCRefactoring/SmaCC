testing
precedenceOf: aString
	| string table |
	string := aString asUppercase.
	table := #(#(':=') #('OR') #('AND') #('XOR') #(',') #('<>' '>' '<' '=' '<=' '>=' 'IN') #('AS' 'IS' 'ABSOLUTE') #('+' '-') #('DIV' 'MOD' 'SHL' 'SHR' '*' '/') #('@') #('.' '^')).
	1 to: table size do: [ :i | 
		((table at: i) includes: string)
			ifTrue: [ ^ i ] ].
	^ nil