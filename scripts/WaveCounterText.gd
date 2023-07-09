extends Label

@onready var signal_bus = get_node("/root/SignalBus")

var cur_wave = 1

func _ready():
	signal_bus.new_wave.connect(_new_wave)
	update_label()

func _new_wave():
	cur_wave += 1
	update_label()

func update_label():
	text = "wave " + str(cur_wave)
