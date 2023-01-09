//var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));
//var _left = keyboard_check(vk_left);
//var _up = keyboard_check(vk_up);
//var _down = keyboard_check(vk_down);

//var _shift = keyboard_check(vk_lshift);
//var _space = keyboard_check_released(vk_space);

//var _lmb = mouse_check_button_released(mb_left);


//var _inputX = _right - _left;
//var _inputY = _down - _up;

//moveX = _inputX * (_shift? slideSpeed : moveSpeed);
//moveY = _inputY * (_shift? slideSpeed : moveSpeed);


//if(_lmb && !bowAttackIP)
//{
//	bowAttackIP = true;
//	sprite_index = sprite_player_bow_attack;
//	current_animation_frame_index = 0;
//}
//else if(bowAttackIP && current_animation_frame_index < sprite_get_number(sprite_index))
//{
//	current_animation_frame_index++;
//}
//else
//{
//	sprite_index = sprite_player_idle;	
//	bowAttacklIP = false;
//}




//if(_space && currentState != PlayerState.Attack)
//{
//	sprite_index = sprite_player_attack_1;
//	currentState = PlayerState.Attack;
//	current_animation_frame_index = 0;
	
//}
//else if(currentState == PlayerState.Attack && current_animation_frame_index < sprite_get_number(sprite_player_attack_1))
//{
//	current_animation_frame_index++;
//}
//else
//{
//	sprite_index = sprite_player_idle;	
//	currentState = PlayerState.Idle;
//}


//if(moveX != 0 || moveY != 0)
//{
//	if(_shift)
//		sprite_index = sprite_player_slide;
//	else
//		sprite_index = sprite_player_run;
//}

//var xDirSign = sign(moveX);

//if(xDirSign != 0)
//{
//	image_xscale = xDirSign;
//}

//x += moveX;
//y += moveY;
var _currentInput = new pressedKeys();

if(currentState == noone)
	throw ("Current Character State found to be noone!!");

var _newState = currentState.handleInput(_currentInput, oCharacter);

if(_newState != noone)
{
	currentState.exitState(oCharacter);
	currentState = _newState;
	currentState.enterState(oCharacter);
}

get_character_state().updateCounters();








