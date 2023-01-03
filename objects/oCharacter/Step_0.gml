var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _left = keyboard_check(vk_left);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);

var _shift = keyboard_check(vk_lshift);
var _space = keyboard_check_released(vk_space);

var _lmb = mouse_check_button_pressed(mb_left);


var _inputX = _right - _left;
var _inputY = _down - _up;

moveX = _inputX * (_shift? slideSpeed : moveSpeed);
moveY = _inputY * (_shift? slideSpeed : moveSpeed);


if(_lmb)
{
	draw_lightning(x, y, mouse_x, mouse_y, 5, 10, 4, 9);	
}

if(_space && currentState != PlayerState.Attack)
{
	sprite_index = sprite_player_attack_1;
	currentState = PlayerState.Attack;
	current_animation_frame_index = 0;
	
}
else if(currentState == PlayerState.Attack && current_animation_frame_index < sprite_get_number(sprite_player_attack_1))
{
	current_animation_frame_index++;
}
else if(moveX != 0 || moveY != 0)
{
	if(_shift)
		sprite_index = sprite_player_slide;
	else
		sprite_index = sprite_player_run;
}
else
{
	currentState = PlayerState.Idle;
	sprite_index = sprite_player_idle;	
}

var xDirSign = sign(moveX);

if(xDirSign != 0)
{
	image_xscale = xDirSign;
}

x += moveX;
y += moveY;






