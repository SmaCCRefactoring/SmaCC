private
actionForCurrentToken
	| ids action |
	ids := currentToken ids.
	1
		to: ids size
		do:
			[:i | 
			action := self actionFor: (ids at: i).
			(action bitAnd: self actionMask) = self errorAction ifFalse: [^action].
			(ids at: i) = scanner negativeNumberId
				ifTrue:
					[currentToken := SmaCCToken
						value: '-'
						start: currentToken startPosition
						ids: (Array with: scanner binarySymbolId).
					self position: currentToken stopPosition - 1.
					^self actionForCurrentToken]].
	^self errorAction