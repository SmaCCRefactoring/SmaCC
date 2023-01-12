view
open
	"Open the window, as simple as that."

	| pane group |
	pane := PanelMorph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeTableLayout;
		cellInset: 0;
		cellPositioning: #leftCenter;
		yourself.	"non pane color tracking"
	group := Morph new
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		fillStyle: Color transparent;
		changeProportionalLayout;
		yourself.	"non pane color tracking"
	window := self theme newWindowIn: World for: self title: self title.
	window addMorph: pane frame: (0 @ 0 corner: 1 @ 1).
	treeMorph := self defaultTreeMorph.
	textMorph := self defaultTextMorph.
	treeMorph buildContents.
	"treeMorph on: #keyStroke send: #startSearch:for: to: AltKeyboardSearchInTree."
	pane addMorph: group.
	group addMorph: treeMorph fullFrame: (
		LayoutFrame new 
			leftFraction: 0; 
			topFraction: 0.0; 
			rightFraction: 0.3;
			bottomFraction: 1;
			leftOffset: 0;
			topOffset: 1;
			rightOffset: 0;
			bottomOffset: -1).
	group addMorph: textMorph fullFrame: (
		LayoutFrame new 
			leftFraction: 0.3; 
			topFraction: 0.0; 
			rightFraction: 1;
			bottomFraction: 1;
			leftOffset: 4;
			topOffset: 0;
			rightOffset: 0;
			bottomOffset: 0).
	group
		addMorph:
			(ProportionalSplitterMorph new
				layoutFrame: (LayoutFrame new 
					leftFraction: 0.3; 
					topFraction: 0.0; 
					rightFraction: 0.3;
					bottomFraction: 1;
					leftOffset: 0;
					topOffset: 0;
					rightOffset: 4;
					bottomOffset: 0);
				addLeftOrTop: treeMorph;
				addRightOrBottom: textMorph).
	window minimumExtent: 500 @ 500.
	window open