actions
removeFiles: anArray
	| files |
	anArray isEmpty
		ifTrue: [ ^ self ].
	(self confirm: 'Do you want to remove the files?')
		ifFalse: [ ^ self ].
	files := Set withAll: self model files.
	anArray do: [ :each | files remove: each ifAbsent: [  ] ].
	self model files: files asSortedCollection