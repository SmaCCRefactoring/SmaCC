accessing
category
	^ category ifNil: [ category := RPackage defaultPackageName ]