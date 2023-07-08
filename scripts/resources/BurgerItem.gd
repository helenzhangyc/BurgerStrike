class_name BurgerItem extends Item

const ingrs = preload("res://scripts/IngredientsEnum.gd")
# An item that goes into the player's burger

@export var type : ingrs.Ingredients
