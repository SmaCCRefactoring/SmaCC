private
addComponent: each 
	(each = self or: [components includes: each]) ifTrue: [^self].
	components add: each.
	each addDependent: self.
	self addAll: each symbols