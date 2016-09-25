private
actionForCurrentToken
	self tryAllTokens
		ifTrue:
			[ | ids action |
			ids := currentToken ids.
			1 to: ids size do:
				[ :i | 
				action := self actionFor: (ids at: i).
				(action bitAnd: self actionMask) = self errorAction
					ifFalse: [ ^ action ] ].
			^ self errorAction ]
		ifFalse: [ ^ self actionFor: currentToken ids first ]