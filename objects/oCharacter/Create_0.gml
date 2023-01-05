enum PlayerState
{
	Idle,
	Attack,
	Jump
}


currentState = PlayerState.Idle;

moveSpeed = 2.5;
slideSpeed = 4;
moveX = 0;
moveY = 0;

bowAttackIP = false;
swordAttackIP = false;

var abstractState = new State();
var attackState = new AttackState();