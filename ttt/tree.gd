extends Marker2D

var trees : PackedScene = load("res://ttt/tree.tscn")

var random = RandomNumberGenerator.new()
var r = 1

const rotation_max = 35

func ttt() -> void:
	var t = trees.instantiate()
	t.position = $tree_pos.position
	add_child(t)
	if Auto.one_time == false:
		rotation_degrees = random.randi_range(-rotation_max,rotation_max)

func ttt2() -> void:
	for i in 2:
		var t = trees.instantiate()
		t.position = $tree_pos.position
		add_child(t)
		rotation_degrees = random.randi_range(-rotation_max,rotation_max)

func ttt3() -> void:
	$"Pixil-frame-0(80)".visible = true

func _ready():
	random.randomize()
	if Auto.one_time == false:
		if Auto.trees >= 90:
			r = random.randi_range(1,2)
		if Auto.trees < 90:
			r = random.randi_range(1,3)
	await (get_tree().create_timer(.3).timeout)
	
	if Auto.trees > 0:
		Auto.trees -= 1
		
		if r == 1:
			ttt()
		if r == 2:
			ttt2()
		if r == 3:
			ttt3()
	else :
		$"Pixil-frame-0(80)".visible = true
	
	Auto.one_time = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
