extends Camera2D

# "c" means camera
export var c_mouse_reach = 4.5 #The distance you can see away from the player
export var c_dis_sens = 500 #Mouse distance from player, sensitivity (500 for my computer, 720 for school computers)
var c_mouse_pos = Vector2()
var shake = 0
var c_mouse_dis = 0
var c_mouse_zoom = 0

func _ready():
	shake = 0
	smoothing_speed = 3 #Set camera smoothness
	c_mouse_zoom = 10
	zoom = Vector2(1, 1)

func _process(_delta):
	if Player.screen_shake != 0: camera_shake()

	get_camera_zoom()
	get_camera_pos()

	position = c_mouse_pos #Apply camera position


func get_camera_pos(): #Find camera position
	c_mouse_pos = get_local_mouse_position() #Go to mouse position
	c_mouse_pos.x = ((c_mouse_pos.x/c_mouse_reach) + Player.GLOBAL_p_pos.x) + rand_range(shake, shake * -1) #Go to player X-Axis + mouse position
	c_mouse_pos.y = ((c_mouse_pos.y/c_mouse_reach) + Player.GLOBAL_p_pos.y) + rand_range(shake, shake * -1) #Same as above with Y-Axis


func get_camera_zoom(): #Find camera zoom
	#Using Pythagorus to find the distance the player is from the mouse on an angle
	var c_pos = Vector2(c_mouse_pos.x - Player.GLOBAL_p_pos.x, c_mouse_pos.y - Player.GLOBAL_p_pos.y)
	c_mouse_dis = (sqrt((c_pos.x * c_pos.x) + (c_pos.y * c_pos.y)))

	c_mouse_dis = (c_mouse_dis / c_dis_sens) + 0.6   #Use the value to find a suitable zoom for the viewport
	c_mouse_zoom += (c_mouse_dis - c_mouse_zoom) / 8

	c_mouse_zoom = clamp(c_mouse_zoom, 0.6, 1.75)  #Clamp zoom values to not go too high or low

	zoom = Vector2(c_mouse_zoom, c_mouse_zoom)  #Set the camera zoom

func camera_shake(): #Apply screenshake
	if Player.shake_mode == false: shake = Player.screen_shake
	else: shake = Player.screen_shake / 3
	yield(get_tree().create_timer(0.1), "timeout") #Close Game delay
	shake = 0 #Remove screenshake

	Player.screen_shake = 0
