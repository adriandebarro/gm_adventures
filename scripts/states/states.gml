// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum PlayerFSMState 
{
	SWORD_ATTACK,
	RUNNING,
	WALKING,
	SLIDING,
	HURT,
	IDLE
}

function pressedKeys() constructor
{
	_mouseX = -1;
	_mouspeY = -1;
	
	_lmPressed = false;
	_lmReleased = false;
	
	_rmPressed = false;
	_rmReleased = false;
	
	_upArrowPressed = false;
	_upArrowReleased = false;
	
	_downArrowPressed = false;
	_downArrowReleased = false;
	
	_rightArrowPressed = false;
	_rightArrowReleased = false;
	
	_shiftPressed = false;
	_shiftReleased = false;
	
	static getPressedInput = function()
	{
		_lmPressed = mouse_check_button_pressed(mb_left);
		_lmReleased = mouse_check_button_released(mb_left);
		
		_rmPressed = mouse_check_button_pressed(mb_right);
		_rmReleased = mouse_check_button_pressed(mb_left);
		
		_mouseX = mouse_x;
		_mouseY = mouse_y;
		
		_upArrowPressed = keyboard_check(vk_up);
		_upArrowReleased = keyboard_check_released(vk_up);
		
		_downArrowPressed = keyboard_check(vk_down);
		_downArrowReleased = keyboard_check_released(vk_down);
		
		_rightArrowPressed = keyboard_check(vk_right);
		_rightArrowReleased = keyboard_check_released(vk_right);
		
		_leftArrowPressed = keyboard_check(vk_left);
		_leftArrowReleased = keyboard_check_released(vk_left);
		
		_shiftPressed = keyboard_check(vk_shift);
		_shiftReleased = keyboard_check_released(vk_shift);
	}
	
	static isMoving = function()
	{
		return _leftArrowPressed || _rightArrowPressed || _upArrowPressed || _downArrowPressed;	
	}
	
	getPressedInput();	
}

function State(state) constructor
{
	stateType = state;
	current_animation_frame_index = 0;
	
	static enterState = function(_character)
	{
		// enter called upon creation of the new state
		// set the animation that we need etc
		_character.sprite_index = noone;
	}
	
	// exit called before destroying the current state
	static exitState = function()
	{
		// do nothing by default
	}
	
	// 
	static handleInput = function(_input, _character) 
	{	
		show_debug_message("Hello from the base playerstate");
		// handle the input here
		return noone;
	}
	
	static update = function(_character)
	{
		// update animation details
		current_animation_frame_index++;
	}
}

function sliding() : State(PlayerFSMState.RUNNING) constructor
{
	// time taken to be able to slide again
	counterSize = 10;
	
	static enterState = function(_character)
	{
		_character.sprite_index = sprite_player_slide;	
	}
	
	static handleInput = function(_input, _character)
	{
		if((!_input._shiftPressed || counterSize == 0) && _input.isMoving())
		{
			return new walking(false);
		}
		else
		{
			with(_character)
			{
				var _inputX = _input._rightArrowPressed - _input._leftArrowPressed;
				var _inputY = _input._downArrowPressed - _input._upArrowPressed;
		
				var _moveX = _inputX * _character.slideSpeed;
				var _moveY = _inputY * _character.slideSpeed;
		
				image_xscale = sign(_moveX);
				x += _moveX;
				y += _moveY;
			}
			
			counterSize--;	
			return noone;
		}
	}
}

function walking(slideFull = true) : State(PlayerFSMState.SLIDING) constructor
{
	slideCounter = slideFull? 100 : 0;
	
	static enterState = function(_character)
	{
		_character.sprite_index = sprite_player_run;	
	}
	
	static handleInput = function(_input, _character)
	{
		if(slideCounter < 100)
			slideCounter++;
		
		if(_input.isMoving() && _input._shiftPressed && slideCounter == 100)		
		{
			return new sliding();
		}
		else if(_input.isMoving())
		{
			with(_character)
			{
				var _inputX = _input._rightArrowPressed - _input._leftArrowPressed;
				var _inputY = _input._downArrowPressed - _input._upArrowPressed;
		
				var _moveX = _inputX * _character.moveSpeed;
				var _moveY = _inputY * _character.moveSpeed;
		
				image_xscale = sign(_moveX);
				x += _moveX;
				y += _moveY;
			}
			return noone;
		}
		else
		{
			return new idle();	
		}
	}
}


function idle() : State(PlayerFSMState.IDLE) constructor
{
	static enterState = function(_character)
	{
		with(_character)
		{
			sprite_index = sprite_player_idle;
		}
	}
	
	static handleInput = function(_input, _character)
	{
		if(_input.isMoving())
		{
			return new walking();
		}
		else
		{
			return noone;	
		}
	}
}