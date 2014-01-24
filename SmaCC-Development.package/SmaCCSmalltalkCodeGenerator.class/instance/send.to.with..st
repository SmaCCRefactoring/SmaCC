code
send: selectorString to: receiverString with: argumentString
	^'(' , receiverString , ') ' , selectorString , ' (' , argumentString , ')'