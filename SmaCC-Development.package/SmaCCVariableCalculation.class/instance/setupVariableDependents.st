private
setupVariableDependents
	self rhsDo: [ :rhs | self setupVariableDependentsFor: rhs ]