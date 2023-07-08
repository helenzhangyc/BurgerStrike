extends Camera2D

@export var TargetNodepath: NodePath
var target_node
@export var lerpspeed: float

func _ready():
		target_node  = get_node(TargetNodepath)
func _process(delta):

	self.position = lerp(self.position, target_node.position, lerpspeed)
