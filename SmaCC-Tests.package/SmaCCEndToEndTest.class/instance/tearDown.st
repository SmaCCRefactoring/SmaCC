private
tearDown
	"When tearing down, reset our package to its previous status."

	self removeNewClasses.
	MCWorkingCopy allManagers
		do: [ :each | 
			each package name = self package name
				ifTrue: [ each modified: currentModifiedStatus ] ].
	super tearDown