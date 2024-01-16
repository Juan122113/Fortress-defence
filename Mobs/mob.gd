extends CharacterBody2D

@export var speed = 300
var health = 5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed*delta)
	
	if get_parent().progress >= 1536:
		if get_parent().progress >= 1650:
			if get_parent().progress >= 2900:
				$Explosion/AnimationPlayer.play("explosion")
				$Explosion.visible = true
				$Zombie.visible = false
			else:
				$Zombie/AnimationPlayer.play("misil")
			speed += 9
		else:
			$Zombie/AnimationPlayer.play("walk_misil")
		
	else:
		$Zombie/AnimationPlayer.play("walk_slow")
		
	if health <= 0:
		queue_free()
			
		
	


func _on_animation_player_animation_finished(anim_name):
	queue_free()
	
