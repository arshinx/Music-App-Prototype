# Array
albumArt = [image1.image, image2.image, image3.image]
albums = []

# Vars - Drag Offset
dragOffsetX = 0
dragOffsetY = 0

# Functions
setupDragDefaults = (albumStack) ->
	albumStack[0].draggable = true
	dragOffsetX = 0
	dragOffsetY = 0	

# Loop to create albums
for index in [0..2]
	albumDimension = 320 - (index * 80) # 80 pt. differencial
	# Create album
	album = new Layer
	album.states.initialState =
		# Size
		x: album1.x + (index * 40)
		y: album1.y - (index * 20)
		width: albumDimension
		height: albumDimension
		# Properties
		rotation: 0
		scale: 1
		borderRadius: 16
		backgroundColor: "#fff"
		clip: true
		shadowBlur: 16 / (index + 1)
		shadowY: 8 - (index * 4)
		index: 3 - index # reverse order
	
	# Initial State
	album.stateSwitch "initialState"
	
	# Shadows Config
	if index < 2
		album.shadowColor = "rgba(0, 0, 0, 0.15)"
	else
		album.shadowColor = "rgba(0, 0, 0, 0)"
	
	# Add Artwork (image)
	artwork = new Layer
		image: albumArt[index]
		width: albumDimension
		height: albumDimension
	album.addChild(artwork)
	artwork.center() # center align img
	
	# Add events
	album.onDragStart (event, layer) ->
		this.animate
			scale: 1.05
			options:
				time: 0.15
				curve: Bezier.easeOut
	
	album.onDragMove (event, layer) ->
		#this.x = album1.x # disable horizontal movement 
		#this.y = album1.y  # disable vertical movement 
		dragOffsetX = this.draggable.offset.x
		dragOffsetY = this.draggable.offset.y
		this.rotation = dragOffsetX * 0.05
	
	album.onDragEnd (event, layer) ->
		this.animate "initialState",
			time: 0.75
			curve: Spring(damping: 0.5)
	
	album.draggable = true
	# Add album to array
	albums.push(album) 

# Setup
setupDragDefaults(albums)



