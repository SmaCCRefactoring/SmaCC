private
reduceActionsDo: aBlock
	self
		actionsDo: [ :each | 
			(each bitAnd: self actionMask) = self reduceAction
				ifTrue: [ aBlock value: each ] ]