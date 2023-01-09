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
		
		_spacePressed = keyboard_check(vk_space);
		_spaceReleased = keyboard_check_released(vk_space);
	}
	
	static isMoving = function()
	{
		return _leftArrowPressed || _rightArrowPressed || _upArrowPressed || _downArrowPressed;	
	}
	
	static isAttacking = function()
	{
		return _spaceReleased;	
	}
	
	static isAttackHeld = function()
	{
		return !_spaceReleased;	
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
		return noone;
	}
	
	static update = function(_character)
	{
		// update animation details
		current_animation_frame_index++;
	}
}

function sliding(slideDuration) : State(PlayerFSMState.SLIDING) constructor
{
	slideRemaining = slideDuration;
	
	static enterState = function(_character)
	{
		_character.sprite_index = sprite_player_slide;	
		var _charState = get_character_state();
	}
	
	static handleInput = function(_input, _character)
	{
		var _charState = get_character_state();
		
		if((!_input._shiftPressed || slideRemaining <=  0) && _input.isMoving())
		{
			return new walking();
		}
		else
		{
			with(_character)
			{
				var _inputX = _input._rightArrowPressed - _input._leftArrowPressed;
				var _inputY = _input._downArrowPressed - _input._upArrowPressed;
		
				var _moveX = _inputX * _charState.getSlideSpeed();
				var _moveY = _inputY * _charState.getSlideSpeed();
		
				image_xscale = sign(_moveX);
				x += _moveX;
				y += _moveY;
			}
			
			slideRemaining--;
			return noone;
		}
	}
}

function walking() : State(PlayerFSMState.SLIDING) constructor
{
	static enterState = function(_character)
	{
		_character.sprite_index = sprite_player_run;	
	}
	
	static handleInput = function(_input, _character)
	{	
		var _charState = get_character_state();
		
		if(_input.isMoving() && _input._shiftPressed && _charState.canSlide())		
		{
			_charState.clearSlidingTimer();
			return new sliding(_charState.getSlideDuration());
		}
		else if(_input.isMoving())
		{
			with(_character)
			{
				var _inputX = _input._rightArrowPressed - _input._leftArrowPressed;
				var _inputY = _input._downArrowPressed - _input._upArrowPressed;
		
				var _moveX = _inputX * _charState.moveSpeed;
				var _moveY = _inputY * _charState.moveSpeed;
		
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
		else if(_input.isAttacking())
		{
			return new swordAttack();
		}
		else
		{
			return noone;	
		}
	}
}

function swordAttack() : State(PlayerFSMState.SWORD_ATTACK) constructor
{
	static enterState = function(_character)
	{		
		with(_character)
		{
			sprite_index = sprite_player_attack_1;
		}
	}
	
	static handleInput = function(_input, _character)
	{
		var _animatioinEnded = false;
		var _numberFrames = sprite_get_number(sprite_player_attack_1);
		
		with(_character)
		{
			_animatioinEnded = _character.image_index == _numberFrames;
		}
		
		if(_animatioinEnded)
		{
			return new idle();
		}
		else
		{
			// check for intersection
			return noone;	
		}
	}
}

function throw_arrow() : State(PlayerFSMState.SWORD_ATTACK) constructor
{	
	static enterState = function(_character)
	{
		animation_length = sprite_get_number(sprite_player_attack_1);
		animation_remaining = animation_length;
		
		
		with(_character)
		{
			sprite_index = sprite_player_attack_1;
		}	
	}
	
	static handleInput = function(_input, _character)
	{
		if(animation_remaining <=  0)
		{
			return new idle();
		}
		else
		{
			// check for intersection
			return noone;	
		}
	}
}