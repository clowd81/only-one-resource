extends Node2D

const ENEMY = preload("res://objects/Enemy.tscn")

# Declare member variables here. Examples:
var speed = 300
var total_offset = 0
var elapsedTime = 0

func spawn_enemy(path):
    var follower = PathFollow2D.new()
    var newEnemy = ENEMY.instance()
    newEnemy.rotation_degrees = 270
    follower.add_child(newEnemy)
    path.add_child(follower)

# Called when the node enters the scene tree for the first time.
func _ready():
    spawn_enemy($path01)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    var distance = delta * speed
    total_offset += distance
    
    # Iterate over all follower children
    for follower in $path01.get_children():
        follower.offset += distance
    
func _on_Timer_timeout():
    elapsedTime += $Timer.wait_time
    spawn_enemy($path01)
    
