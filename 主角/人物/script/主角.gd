extends CharacterBody2D

# 血量 & 蓝条
var hp = 100
var max_hp = 100

var mp = 80
var max_mp = 80

var look_dir ="right"
# 移动速度
const speed = 500

func _physics_process(float):
	# 上下左右方向
	var dir = Vector2.ZERO
	dir.x = Input.get_axis("ui_left", "ui_right")
	dir.y = Input.get_axis("ui_up", "ui_down")

	# 斜向走路速度不变快
	if dir.length() > 0:
		dir = dir.normalized()

	velocity = dir * speed
	move_and_slide()

	# ========== 自动左右翻面朝向 ==========
	if dir.x < 0:
		# 向左走 → 朝左翻转
		$Sprite2D.flip_h = true
		$Sprite2D/AnimationPlayer.play("run")
	elif dir.x > 0 :
		# 向右走 → 朝右正常
		$Sprite2D.flip_h = false
		$Sprite2D/AnimationPlayer.play("run")
		
	elif dir.x == 0:
		# 向右走 → 朝右正常
		$Sprite2D/AnimationPlayer.play("idle")
