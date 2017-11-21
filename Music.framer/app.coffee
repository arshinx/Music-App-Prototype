# Genre Menu
genreMenu.originX = 0
genreMenu.originY = 1 # Bottom Left Origin 

genreMenu.states.menuOff = 
	opacity: 0.00
	scale: 0.50

genreMenu.states.menuOn =
	opacity: 1
	scale: 1

# Animations
genreMenu.animationOptions =
	time: 0.35
	curve: Spring(damping: 0.65)

# Default State: Off
genreMenu.stateSwitch("menuOff")

# Add Genre - Button
addGenreButton.onClick (event, layer) ->
	genreMenu.animate "menuOn"

PlaylistBuilder.onClick (event, layer) ->
	genreMenu.animate "menuOff"
	

