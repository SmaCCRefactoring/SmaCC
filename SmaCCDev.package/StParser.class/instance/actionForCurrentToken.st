private
actionForCurrentToken
	| ids action |
	ids := currentToken id.
	1 to: ids size
		do: 
			[:i | 
			action := self actionFor: (ids at: i).
			(action bitAnd: self actionMask) = self errorAction ifFalse: [^action].
			(ids at: i) = scanner negativeNumberId 
				ifTrue: 
					[currentToken := SmaCCToken 
								value: '-'
								start: currentToken startPosition
								id: (Array with: scanner binarySymbolId).
					scanner position: currentToken stopPosition - 1.
					^self actionForCurrentToken]].
	^self errorAction