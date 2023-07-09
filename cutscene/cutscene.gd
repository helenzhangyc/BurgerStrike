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
	var screenSize = OS.get_window_size()
	$ColorRect.color = Color(0, 0, 0)
	$ColorRect.rect_min_size = Vector2(2000, 2000)
	next(currentImageIndex)

func next(currentImageIndex):
	$TextureRect.texture = load(images[currentImageIndex])
	$TextureRect.rect_scale = Vector2(0.4, 0.4)
	$TextureRect.rect_position = Vector2(500, 50)
	
	if dialogueBox:
		dialogueBox.queue_free() # Clear the previous dialogue box
	
	dialogueBox = RichTextLabel.new()
	dialogueBox.rect_min_size = Vector2(800, 800)
	dialogueBox.rect_position = Vector2(500, 800)
	add_child(dialogueBox)
	
	wordsToShow = texts[currentImageIndex]
	wordIndex = 0
	animateText()

func animateText():
	dialogueBox.bbcode_text = ""
	yield(get_tree().create_timer(0.5), "timeout") # Initial delay
	while wordIndex < wordsToShow.length():
		dialogueBox.bbcode_text += wordsToShow[wordIndex]
		wordIndex += 1
		yield(get_tree().create_timer(letterPause), "timeout")

func _input(event):
	if event.is_action_pressed("ui_accept"):
		numInputs += 1
		var screenSize = OS.get_window_size()
		$ColorRect.color = Color(0, 0, 0)
		$ColorRect.rect_min_size = Vector2(2000, 2000)
		
		if currentImageIndex < images.size() - 1:
			currentImageIndex += 1
			next(currentImageIndex)



