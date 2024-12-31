draw_self();

if (hp < hp_max)
{
	draw_healthbar(x-160,y-320,x+160,y-360,(hp/hp_max)*100, c_black,c_red,c_green,90,true,true)
}