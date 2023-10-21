extends StaticBody2D

signal on_off_change(is_turned_on)

var is_turned_on: bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_turned_on:
		get_node("Sprite2D2").show()
	else:
		get_node("Sprite2D2").hide()
	pass

func turn_on():
	if not is_turned_on:
		is_turned_on = true
		on_off_change.emit(is_turned_on)
	
func turn_off():
	if is_turned_on:
		is_turned_on = false
		on_off_change.emit(is_turned_on)
