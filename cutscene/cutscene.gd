extends Node2D

var images = [
	"res://addons/2f2ac5a1-00b8-414c-80cb-86f3c5ba3055.jpeg",
	"res://addons/4e6debc4-24e0-40a9-b471-2cd752e16d74.jpeg"
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
var not_created = true
func _physics_process(delta):
	if not_created:
		DialogueManager.show_example_dialogue_balloon(load("res://opening.dialogue"),"opening")
		not_created=false
func _ready():
	print("Hello, world!")


	next(currentImageIndex)

func next(currentImageIndex):
	$TextureRect.texture = load(images[currentImageIndex])
	$TextureRect.scale = Vector2(0.4, 0.4)
	$TextureRect.position = Vector2(0, 0)
	
	




func _input(event):
	if event.is_action_pressed("ui_accept"):
		numInputs += 1

		
		if currentImageIndex < images.size() - 1:
			currentImageIndex += 1
			next(currentImageIndex)



