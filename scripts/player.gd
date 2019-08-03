extends Area2D

const BULLET = preload("res://objects/player_bullet.tscn")

# Declare member variables here. Examples:
export var speed = 400  # How fast the player will move (pixels/sec).
export var score = 1000
export var cycle_time = 0.5
var screen_size  # Size of the game window.
var cycling = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    screen_size = get_viewport_rect().size
    
func shoot():
    if cycling <= 0.0:
        cycling = cycle_time
        var bullet = BULLET.instance()
        bullet.global_position = global_position
        get_parent().add_child(bullet)
    pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    cycling -= delta
    
    var velocity = Vector2()  # The player's movement vector.
    if Input.is_key_pressed(KEY_D):
        velocity.x += 1
        
    if Input.is_key_pressed(KEY_A):
        velocity.x -= 1
        
    if Input.is_key_pressed(KEY_S):
        velocity.y += 1
        
    if Input.is_key_pressed(KEY_W):
        velocity.y -= 1
        
    if Input.is_key_pressed(KEY_SPACE):
        shoot()
        
    if velocity.length() > 0:
        velocity = velocity.normalized() * speed
    
    position += velocity * delta
    position.x = clamp(position.x, 16, screen_size.x-16)
    position.y = clamp(position.y, 16, screen_size.y-16)