rewriting
updateClass: aClass
	self rewrites do: [ :each | each updateClass: aClass ]