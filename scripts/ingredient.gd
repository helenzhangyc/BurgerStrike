extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	area_entered.connect(_on_area_entered)
	pass # Replace with function body.

func _on_area_entered(area):
	if area is Enemy:
		queue_free()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
