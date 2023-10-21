extends Node2D

var turned_on_switches: int = 0
var switches: Array[Node]

# Called when the node enters the scene tree for the first time.
func _ready():
	switches = get_tree().get_nodes_in_group("switches")
	for switch in switches:
		switch.connect("on_off_change", _on_switch_state_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_die_pressed():
	get_tree().quit()

func _on_switch_state_changed(is_turned_on):
	if is_turned_on:
		turned_on_switches += 1
	else:
		turned_on_switches -= 1

	if turned_on_switches == switches.size():
		Globals.all_lights_up = true
	else:
		Globals.all_lights_up = false
