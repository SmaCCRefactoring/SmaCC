action table
optimizeTransitionTable: anArray
	| newTable |
	newTable := anArray
		collect: [ :row | 
			row
				collect: [ :action | 
					| newShiftAction |
					(action bitAnd: 2r11) = SmaCCShiftAction id
						ifTrue: [ newShiftAction := self
								optimizedShiftFrom: row
								to: (action bitShift: -2)
								inTable: anArray ].
					newShiftAction notNil
						ifTrue: [ newShiftAction ]
						ifFalse: [ action ] ] ].
	^ newTable