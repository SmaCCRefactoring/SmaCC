code
send: selectorString to: receiverString with: firstArgumentString with: secondArgumentString with: thirdArgumentString
	| keywords |
	keywords := selectorString asSymbol keywords.
	^'(' , receiverString , ') ' , keywords first , ' (' , firstArgumentString , ') ' , (keywords at: 2) , ' ('
		, secondArgumentString , ') ' , keywords last , ' (' , thirdArgumentString , ')'