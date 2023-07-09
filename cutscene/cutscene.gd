

extends Node2D

var images = [
	"res://2f2ac5a1-00b8-414c-80cb-86f3c5ba3055.jpeg",
	"res://4e6debc4-24e0-40a9-b471-2cd752e16d74.jpeg"
	
]
var texts = [
	"I spent my entire life in a dead-end job, if by some miracle I return to this world, I want to be a piece of warm bread! No responsibilities, no deadlines, no bills, I'll be worry free toasting under the sun",
	"EKLJRKJEJKRLAKEJRLKEAJRLKAJWLKRJwlkrjLKJKJLKJLKEJLKJLKRJALKEJRKLAEJRAKLEJRAEKLJR"
]
var currentImageIndex = 0
var wordsToShow = ""
var wordIndex = 0
var letterPause = 0.05
var dialogueBox: RichTextLabel
var numInputs = 0
func _ready():
	print("Hello, world!")
	#_draw()
	var screenSize = OS.get_window_size()
	$ColorRect.color = Color(0, 0, 0)
	$ColorRect.rect_min_size =  Vector2(2000, 2000) #change bg color 
	next(currentImageIndex)
	
	
func next(currentImageIndex):
	#maybe clear screen 
		$TextureRect.texture = load(images[currentImageIndex])  # Display the first image
		$TextureRect.rect_scale = Vector2(0.4, 0.4)
		var pictureSize = $TextureRect.texture.get_size()
		# Set the position of the picture
		$TextureRect.rect_position = Vector2(500, 50)
		if dialogueBox: 
			dialogueBox.queue_free() # Clear the previous dialogue box
		dialogueBox = RichTextLabel.new()
		dialogueBox.rect_min_size = Vector2(800, 800)
		dialogueBox.rect_position = Vector2(500, 800)
		#dialogueBox.add_font_override()
		dialogueBox.bbcode_text = texts[currentImageIndex]
		add_child(dialogueBox)
		wordsToShow = texts[currentImageIndex]
		wordIndex = 0
		animateText()
		#yield(get_tree().create_timer(4), "timeout")
	
func animateText():
	wordsToShow = texts[currentImageIndex]
	dialogueBox.bbcode_text = ""
	# Initial delay 
	yield(get_tree().create_timer(0.5), "timeout") 
	while wordIndex < wordsToShow.length():
		dialogueBox.bbcode_text += wordsToShow[wordIndex]
		wordIndex += 1
		yield(get_tree().create_timer(letterPause), "timeout")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		numInputs +=1
		var screenSize = OS.get_window_size()
		$ColorRect.color = Color(0, 0, 0)
		$ColorRect.rect_min_size =  Vector2(2000, 2000) #change bg color 
		if currentImageIndex < images.size() - 1:
			currentImageIndex += 1
			next(currentImageIndex)

		
		


