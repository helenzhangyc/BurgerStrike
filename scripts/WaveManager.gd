extends Node

@onready var waves = $Waves
@onready var spawn_points = $SpawnLocations
@onready var spawn_timer = $SpawnTimer

@onready var globals = get_node("/root/Globals")
@onready var signal_bus = get_node("/root/SignalBus")

@export var current_wave: int = 0

# time between waves
@export var WAVE_REST = 1
# time between spawning concecutive enemies
@export var SPAWN_REST = 0.2

# keep track of how many enemies are left
var left_in_wave = 0

func _ready():
	signal_bus.enemy_died.connect(_enemy_died)

	spawn_timer.timeout.connect(_on_spawn_timer_timeout)
	spawn_timer.one_shot = true
	start_wave()

func _enemy_died():
	left_in_wave -= 1
	if left_in_wave <= 0:
		left_in_wave = 0
		spawn_timer.start()


func _on_spawn_timer_timeout():
	print("starting wave")
	start_wave()


func start_wave():
	spawn_timer.stop()
	# get all the spawns in the wave
	print("current wave:", current_wave, waves.get_child(current_wave))
	current_wave = min(current_wave, waves.get_children().size()-1)
	await get_tree().create_timer(WAVE_REST).timeout	
	for wave_spawn in waves.get_child(current_wave).get_children():

		# pick a random spawn point
		var spawn_point = spawn_points.get_children()[randi() % len(spawn_points.get_children())]
		for i in range(wave_spawn.count):
		
			# spawn the enemy
			var inst = wave_spawn.enemy.instantiate()
			# print("instantiate enemy", inst)
			inst.global_position = spawn_point.global_position

			globals.add_child(inst)

			await get_tree().create_timer(SPAWN_REST).timeout	
			left_in_wave += 1

	current_wave += 1

