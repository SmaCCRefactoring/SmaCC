actions
findPackage
	| packageName |
	packageName := self
		choose: 'In which package to you want the generated code to go to?'
		from: RPackageOrganizer default packageNames asSortedCollection.
	packageName notNil
		ifTrue: [ 
			packageMorph hResizing: #rigid.
			packageMorph
				newContents: '';
				newContents: packageName ]