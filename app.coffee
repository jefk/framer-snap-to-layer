anchors = []

for x in [0..5]
	anchors.push new Layer
		x: 40
		y: 70*x + 40
		backgroundColor: 'tomato'
		height: 60
		width: 400

dragMe = new TextLayer
	x: 100
	y: 480
	height: 50
	width: 300
	borderWidth: 3
	text: "I'M A DRAG"
	textAlign: 'center'

distanceBetween = (layerA, layerB) ->
	(layerA.midX - layerB.midX) ** 2 + (layerA.midY - layerB.midY) ** 2

dragMe.draggable.enabled = true
dragMe.draggable.momentumOptions =
	friction: 10
	tolerance: 0.1

dragMe.onDragAnimationEnd ->
	closestAnchor = anchors[0]
	minDistance = distanceBetween dragMe, anchors[0]
	for anchor in anchors
		distance = distanceBetween anchor, dragMe
		if distance < minDistance
			closestAnchor = anchor
			minDistance = distance
	dragMe.midX = closestAnchor.midX
	dragMe.midY = closestAnchor.midY

