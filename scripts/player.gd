extends CharacterBody2D


const SPEED = 100.0
const DAMAGE: float = 1

var current_dir = "none"
var time: float = 0
var total_damage: float

func _ready():
	get_node("TextureProgressBar").value = 0
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movements(delta)
	
func _process(delta):
	total_damage = delta * DAMAGE * float(Globals.lights_up)
	get_node("TextureProgressBar").value += total_damage
	
func player_movements(_delta):
	
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = SPEED
		velocity.y = 0
		
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.2)
		
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -SPEED
		velocity.y = 0
		
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.2)
		
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = 0
		velocity.y = SPEED
		
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.2)
		
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = 0
		velocity.y = -SPEED
		
		if $Timer.time_left <= 0:
			$AudioStreamPlayer2D.pitch_scale = randf_range(0.8, 1.2)
			$AudioStreamPlayer2D.play()
			$Timer.start(0.2)
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		

		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false 
		
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
			
	if dir == "left":
		anim.flip_h = true 
		
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			anim.play("side_idle")
			
	if dir == "down":
		
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			anim.play("front_idle")
			
	if dir == "up":
		
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			anim.play("back_idle")
