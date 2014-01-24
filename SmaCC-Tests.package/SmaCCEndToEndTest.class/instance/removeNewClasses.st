private
removeNewClasses
	| classesToRemove |
	classesToRemove := self classesInPackage reject: [ :each | currentClasses includes: each ].
	(classesToRemove asSortedCollection: [ :a :b | a allSuperclasses size > b allSuperclasses size ])
		do: [ :each | self removeClass: each ]