#States

Header.states = 
	hide:
		y: -Header.maxY

Footer.states =
	hide:
		y: Screen.height + Footer.height
	animationOptions:
		delay: 1

moveimage_txt.states =
	hide:
		opacity:0
	animationOptions:
		time: 0.3

moveImage.states = 
	onglobal:
		parent: Home
		y: Feed.y
		x: Feed.x
	show:
		parent: Home
		x: 0
		y: 0
		originX: 0.5
		originY: 0.5
		scale: 1.5

articles.states =
	hide:
		y: 1200
		
Detail.states = 
	hide:
		y: Screen.height
	show:
		y: 0
		
DetailFooter.states =
	show: 
		y: Screen.height - 2 * Footer.height
	slideDown:
		y: Screen.height - DetailFooter.height

#Initialize


#ScrollComponentを作成
scroll = new ScrollComponent
	parent: Home
	scrollHorizontal: false
	size: Screen.size
scroll.sendToBack()
Feed.parent = scroll.content


#AnimationSetting
Framer.Defaults.animationOptions =
	curve: Bezier.ease


moveImage.onTap (event, layer) ->
	moveImage.stateSwitch("onglobal")
	for i, el of [Header, moveimage_txt, articles, Footer]
		el.stateCycle("hide", "default")
	
	for i, el of [Detail, DetailFooter]
		el.stateCycle("show", "default")
	
	moveImage.stateCycle "show"

	Detail.onAnimationEnd (event, layer) ->
		DetailFooter.animate "slideDown"


