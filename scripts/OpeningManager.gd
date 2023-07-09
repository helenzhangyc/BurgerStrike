extends Node

var is_veg: bool
var is_halal: bool
var toppings: Array[BurgerItem] =[]
var sauces: Array[SauceItem] =[]
var not_created = true
func _physics_process(delta):
	if not_created:
		DialogueManager.show_example_dialogue_balloon(load("res://opening.dialogue"),"opening")
		not_created=false
	
