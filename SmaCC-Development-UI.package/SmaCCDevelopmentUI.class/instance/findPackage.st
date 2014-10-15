actions
findPackage
	self
		setPackage:
			(self
				choose: 'In which package to you want the generated code to go to?'
				from: RPackageOrganizer default packageNames asSortedCollection)