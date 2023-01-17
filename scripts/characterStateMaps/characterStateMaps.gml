// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

enum PlayerFSMState 
{
	NONE,
	SWORD_ATTACK,
	ARROW_ATTACK,
	RUNNING,
	WALKING,
	SLIDING,
	HURT,
	IDLE
}

function characterStateCache() constructor
{
	stateMap = ds_map_create();

	static init = function()
	{
		ds_map_add(stateMap, PlayerFSMState.NONE, noone);		
		ds_map_add(stateMap, PlayerFSMState.SWORD_ATTACK, new swordAttack());		
		ds_map_add(stateMap, PlayerFSMState.IDLE, new idle());
		ds_map_add(stateMap, PlayerFSMState.RUNNING, new walking());
		ds_map_add(stateMap, PlayerFSMState.ARROW_ATTACK, new shootArrow());
		// TODO continue adding the states here	
	}
	
	static get_state = function(_playerState)
	{
		var _newState = ds_map_find_value(stateMap, _playerState);
		
		if(_newState == noone)
			throw("State not found!!");
		
		return _newState;
	}
	
	init();
}