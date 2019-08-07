extends Area2D

# Declare member variables here. Examples:
export var velocity = Vector2(0, -600)
export var ownerNode = ""

# Called when the node enters the scene tree for the first time.
func _ready():
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    global_position += velocity * delta
    $AnimatedSprite.play("shoot")    
    if global_position.y <= -16:
        queue_free()

func _on_PlayerBullet_area_entered(area):
    if area.name.find("Enemy") > -1:
        #let the bullet do something upon hitting an enemy.  Maybe an explosion animation?
        #remove pass when new code has been added here
        queue_free()
     
