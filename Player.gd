extends Area2D

signal hit

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

export var w = 10
export var h = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_viewport_rect().size
	
	position.x =  screen_size.x/2 -w
	position.y =  screen_size.y -100
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	
	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	


func _on_Player_body_entered(body):
	
	hide() # Player disappears after being hit.
	emit_signal("hit")
	
	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false


func _on_Player_hit():
	pass # Replace with function body.
