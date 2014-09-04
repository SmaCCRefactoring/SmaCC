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
	treeMorph on: #keyStroke send: #startSearch:for: to: AltKeyboardSearchInTree.
	pane addMorph: group.
	group addMorph: treeMorph fullFrame: (LayoutFrame fractions: (0 @ 0.0 corner: 0.3 @ 1) offsets: (0 @ 1 corner: 0 @ -1)).
	group addMorph: textMorph fullFrame: (LayoutFrame fractions: (0.3 @ 0.0 corner: 1 @ 1) offsets: (4 @ 0 corner: 0 @ 0)).
	group
		addMorph:
			(ProportionalSplitterMorph new
				layoutFrame: (LayoutFrame fractions: (0.3 @ 0.0 corner: 0.3 @ 1) offsets: (0 @ 0 corner: 4 @ 0));
				addLeftOrTop: treeMorph;
				addRightOrBottom: textMorph).
	window minimumExtent: 500 @ 500.
	window open.
	self registerToAnnouncements