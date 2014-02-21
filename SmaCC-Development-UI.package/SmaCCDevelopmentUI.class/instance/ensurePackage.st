private
ensurePackage
	"Make sure the package exists."

	(RPackageOrganizer default packageMatchingExtensionName: self packageString)
		ifNil: [ MCWorkingCopy forPackage: (MCPackage named: self packageString) ]