code generation templates
superMessage: aString argument: firstArgumentString argument: secondArgumentString
	| keywords |
	keywords := aString asSymbol keywords.
	^ 'super ' , keywords first , ' (' , firstArgumentString , ') '
		, keywords last , ' (' , secondArgumentString , ')'