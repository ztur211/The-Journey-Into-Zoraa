extends CanvasLayer

var key = 0

func _ready():
	$Keys.text = String(key)


func _on_key_collected():
	key = key + 1
	_ready()
