#include <stdio.h>
#include <stdlib.h>
#include <X11/Xlib.h>

int main() {
    Display *disp = XOpenDisplay(NULL);

    // Make sure there is a display
    if (!disp) { 
        return 1;
    }
    
    int screenNumber = DefaultScreen(disp);
    
    XEvent event;
    
    // Query the pointer location
    XQueryPointer(disp, RootWindow(disp, DefaultScreen(disp)), &event.xbutton.root, &event.xbutton.window, &event.xbutton.x_root, &event.xbutton.y_root, &event.xbutton.x, &event.xbutton.y, &event.xbutton.state);
    
    // Print only the x-coordinate
    printf("%d\n", event.xbutton.x);

    XCloseDisplay(disp);

    return 0;
}
