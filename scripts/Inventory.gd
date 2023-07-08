
extends Node2D

@export var items : Array[BurgerItem]

# health is equivlanet to number of items in inventory
func get_health():
	return len(items)

func add_item(item):
	items.push_back(item)

# take damage and remove an item from inventory
func remove_item_rand():
	if items.size()==0:
		return null
	var r = randi()%items.size()
	var item = items[r]
	
	items.remove_at(randi()%items.size())
	return item
