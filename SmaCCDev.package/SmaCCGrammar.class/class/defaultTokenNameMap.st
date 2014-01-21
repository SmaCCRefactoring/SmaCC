accessing
defaultTokenNameMap
	| map |
	map := Dictionary new.
	#(#($< 'lessThan') #($> 'greaterThan') #($= 'equal') #($( 'leftParen') #($) 'rightParen') #(${ 'leftBrace') #($} 'rightBrace') #($[ 'leftBracket') #($] 'rightBracket') #($, 'comma') #($; 'semicolon') #($- 'minus') #($+ 'plus') #($* 'times') #($/ 'divide') #($: 'colon') #($. 'period') #($? 'questionMark') #($! 'bang') #($% 'percent') #($^ 'upArrow') #($& 'and') #($| 'or') #($~ 'tilde'))
		do: [:each | map at: each first put: each last].
	^map