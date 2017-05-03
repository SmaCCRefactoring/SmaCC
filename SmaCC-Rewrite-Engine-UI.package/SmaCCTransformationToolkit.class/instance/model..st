accessing
model: aToolkitModel
	self model notNil
		ifTrue: [ self model removeDependent: self ].
	self entity: aToolkitModel.
	aToolkitModel addDependent: self