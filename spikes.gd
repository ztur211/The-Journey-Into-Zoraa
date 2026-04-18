extends Area2D

signal spike_hit

func _on_spikes_body_entered(body):
	emit_signal("spike_hit")
