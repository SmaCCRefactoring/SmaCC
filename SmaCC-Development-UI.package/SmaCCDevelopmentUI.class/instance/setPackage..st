private
setPackage: aPackageName
	aPackageName notNil
		ifTrue: [ 
			packageMorph
				content: aPackageName ]