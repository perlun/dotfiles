#include <stdio.h>
#include <stdlib.h>

#include <strings.h>

#include <X11/Xlib.h>
#include <X11/XKBlib.h>


void set_modifier(int mod, int on)
{
    Display* display = XOpenDisplay(NULL);
    XkbLockModifiers(display, XkbUseCoreKbd, mod, on ? mod : 0);
    XCloseDisplay(display);
}


int get_modifier(int mod)
{
    XkbStateRec xkbState;
    Display* display = XOpenDisplay(NULL);
    XkbGetState(display, XkbUseCoreKbd, &xkbState);
    XCloseDisplay(display);
    return xkbState.locked_mods & mod;
}


void usage(const char* program_name)
{
    printf("Usage: %s (on|off|toggle|get) [MOD]\n\n", program_name);
}


int main(int argc, char** argv)
{
    enum {
        SHOW_USAGE,
        SETCAPSLOCK_ON,
        SETCAPSLOCK_OFF,
        SETCAPSLOCK_TOGGLE,
        GETCAPSLOCK
    };

    int mod = LockMask;     // see <X11/X.h>
    int action = SHOW_USAGE;
    char* cmd;

    if (argc == 3) {
        mod = 1<<atoi(argv[2]);
    }

    if (argc >= 2) {
        cmd = argv[1];
        if (strcasecmp(cmd, "on") == 0) {
            action = SETCAPSLOCK_ON;
        }
        else if (strcasecmp(cmd, "off") == 0) {
            action = SETCAPSLOCK_OFF;
        }
        else if (strcasecmp(cmd, "toggle") == 0) {
            action = GETCAPSLOCK;
        }
        else if (strcasecmp(cmd, "get") == 0) {
            action = GETCAPSLOCK;
        }
    }

    if (action == SHOW_USAGE) {
        usage(argv[0]);
        return 1;
    }

    if (action == SETCAPSLOCK_ON) {
        set_modifier(mod, 1);
    }

    if (action == SETCAPSLOCK_OFF) {
        set_modifier(mod, 0);
    }

    if (action == SETCAPSLOCK_TOGGLE) {
        set_modifier(mod, !get_modifier(mod));
    }

    if (action == GETCAPSLOCK) {
        printf("%s\n", get_modifier(mod) ? "on" : "off");
    }

    return 0;
}
