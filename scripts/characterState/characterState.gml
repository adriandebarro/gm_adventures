// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function characterState() constructor
{
	
	slidingDuration = 50;
	slidingTimerMax = 100;
	slidingTimer = slidingTimerMax;

	moveSpeed = 2.5;
	slideSpeed = 4;
	moveX = 0;
	moveY = 0;

	//bowAttackIP = false;
	//swordAttackIP = false;
	
	// the updateCounters function will take care of recharging the buffers
	// any stats will improve the update speed
	static updateCounters = function()
	{
		if(slidingTimer < slidingTimerMax)
			slidingTimer++;
	}
	
	static canSlide = function()
	{
		return slidingTimer == slidingTimerMax;
	}
	
	static getMoveSpeed = function()
	{
		return moveSpeed;	
	}
	
	static getSlideSpeed = function()
	{
		return slideSpeed;	
	}
	
	static clearSlidingTimer = function()
	{
		slidingTimer = 0;	
	}
	
	static getSlideDuration = function()
	{
		return slidingDuration;	
	}
	
	static destroy = function()
	{
		global.characterState = noone;	
	}
	
	
}

function create_character_state()
{
	global.characterState = new characterState();	
}

function get_character_state()
{
	if(global.characterState == noone)
		throw ("Character State was accessed when the variable is noone!!");
	
	return global.characterState;	
}