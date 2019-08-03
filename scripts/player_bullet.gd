extends RigidBody2D

# Declare member variables here. Examples:
export var velocity = Vector2(0, -300)

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    global_position += velocity * delta
    $AnimatedSprite.play("shoot")
    if global_position.y < 0:
        queue_free()
