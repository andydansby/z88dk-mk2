/*
	Minimal Xlib port
	Stefano Bodrato, 6/3/2007
	
	$Id: displayheight.c,v 1.2 2011/09/09 06:03:28 stefano Exp $
*/

#define _BUILDING_X
#include <X11/Xlib.h>
#include <graphics.h>


int DisplayHeight(Display *display,int screen) {
	return getmaxy();
}

