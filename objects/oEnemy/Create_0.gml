
enum EnemyState
{
	IDLE,
	ROAM,
	AGRO
}


hpMax = 4;
hp = hpMax;

// speed for roaming and when emeny is agroed
roamSpeed = 0.1;
agroSpeed = 0.3;

updateCounterMax = 100;
counter = 0;

// the radius specifies the maximum it will venture around at a given point
roamMaxRadius = 10.0;

enemyState = EnemyState.IDLE;

enemy_sprite = noone;

idleAnimationStartIndex = 0;
idleAnimationEndIndex = 5;
attackAnimationStartIndex = 12;
attackAnimationEndIndex = 16;
walkingAnimationStartIndex = 6;
walkingAnimationEndIndex = 11;


moveX = 0.0;
moveY = 0.0;

targetX = 0;
targetY = 0;

moveSpeed = 0.0;

