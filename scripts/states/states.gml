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

function state(PlayerFSMState state) constructor
{
	static handleInput = function() 
	{	
		show_debug_message("Hello from the base playerstate");
	}
}

function AttackState() : state(PlayerFSMState.SWORD_ATTACK) constructor
{
	static handleInput = function()
	{
		show_debug_message("Hello from the attack state state");	
	}
}



function player_finite_state() constructor
{
	playerState = PlayerState.IDLE;
	
}