instance_destroy(oUITitle);
instance_destroy(oUIParent);

if(pauseSurface)
{
	instance_destroy(pauseSurface);
	pauseSurface = noone;
}