private
send: selectorString to: receiverString with: firstArgumentString with: secondArgumentString
	| keywords |
	keywords := selectorString asSymbol keywords.
	^'(' , receiverString , ') ' , keywords first , ' (' , firstArgumentString , ') ' , keywords last , ' ('
		, secondArgumentString , ')'