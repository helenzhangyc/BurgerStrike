class_name SauceItem extends Item

# An item that can be used as ammunition

@export var damage: int
@export var bullet_sprite: String
@export var bullet_texture: CompressedTexture2D
# how many enemies can bullet hit before destroying itself
@export var pierce: int = 1
