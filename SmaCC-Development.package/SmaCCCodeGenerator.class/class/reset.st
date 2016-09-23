class initialization
reset
	"self reset"

	codeTemplates := nil.
	self allSubclassesDo: [ :each | each reset ]