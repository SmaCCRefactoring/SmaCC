*smacc-debugging-support
maxReturnSizeTable
	| table |
	table := Array new: self transitionTable size withAll: 0.
	1 to: table size do: [ :i | 
		self
			allActionsAndSymbolsForState: i
			do: [ :action :symbol | 
				(action bitAnd: self actionMask) = self reduceAction
					ifTrue: [ | size |
						size := (self reduceTable at: (action bitShift: -2)) at: 2.
						table at: i put: ((table at: i) max: size) ] ] ].
	table max
		timesRepeat: [ 1 to: table size do: [ :i | 
				self
					allActionsAndSymbolsForState: i
					do: [ :action :symbol | 
						(action bitAnd: self actionMask) = self shiftAction
							ifTrue: [ | size |
								size := (table at: (action bitShift: -2)) - 1.
								table at: i put: ((table at: i) max: size) ] ] ] ].
	^ table