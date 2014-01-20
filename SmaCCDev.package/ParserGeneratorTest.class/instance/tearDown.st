running
tearDown
	super tearDown.
	self
		removeAllSelectorsFrom: TestParser;
		removeAllSelectorsFrom: TestParser class;
		removeAllSelectorsFrom: TestScanner;
		removeAllSelectorsFrom: TestScanner class