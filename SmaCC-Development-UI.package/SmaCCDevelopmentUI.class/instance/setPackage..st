private
setPackage: aPackageName
	aPackageName notNil
		ifTrue: [ 
			packageMorph hResizing: #rigid.
			packageMorph
				newContents: '';
				newContents: aPackageName ]