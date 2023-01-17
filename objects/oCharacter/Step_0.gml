
var _currentInput = new pressedKeys();
_currentInput._animationEnded = self.animationEnded;
self.animationEnded = false;

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

var _instances = collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, oEnemy, false, true);

if _instances != noone
{
	with(_instances) 
	{
		instance_destroy();
		get_character_state().hitCount++;
	}
}






