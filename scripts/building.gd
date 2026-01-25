extends Node2D

func _on_area_entered(body):
	if body is PlayerController:
		body.Interact_Node = self
func _on_area_exited(body):
	if body is PlayerController:
		if body.Interact_Node == self:
			body.Interact_Node = null
