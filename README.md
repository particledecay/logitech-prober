logitech-prober
===============

The Problem
-----------
You just purchased a Logitech mouse (or mouse/keyboard combo) for your Ubuntu computer, and it came with that handy little _unifying receiver_.

You plug the receiver in to an open USB port, and nothing happens.

The Other Problem
-----------------
Turns out, it's not a matter of Ubuntu being incompatible, it's just that it appears to fail after the initial probe, and never bothers re-probing for nearby wireless devices again.

*This is easily solved by simply reloading the appropriate modules again to force the system to probe.*

You can run this command to do so:
> $ sudo modprobe -r hid_logitech_dj && sudo modprobe -r usbhid && sudo modprobe usbhid

Of course, that's a pain. This repo is the solution.

The Solution
------------
The most automated way to do this that I've found is to create a script to do this module magic for you upon booting your computer. The script needs to know when to stop messing with your modules, so I also created a program that does nothing more than output your mouse's current X coordinates.

_Once you've followed the installation instructions below, you should be able to simply keep moving your wireless mouse after you get to the login screen until your mouse starts moving, and the script should end itself automatically._

Installation
------------
1. Clone this repo (or [download as a zip](https://github.com/TheRealJoeLinux/logitech-prober/zipball/master)), and then *cd* into the resulting directory.
> $ git clone git://github.com/TheRealJoeLinux/logitech-prober.git
> $ cd logitech-prober/
2. Install the packages [build-essential](apt:build-essential) and [libx11-dev](apt:libx11-dev), if you don't have them already.
> $ sudo apt-get install build-essential libx11-dev
3. Compile the file that spits out your mouse's X coordinates
> $ make
4. Copy the resulting executable to /usr/local/bin/ (or wherever you want, just edit "logitech-prober.sh" to reflect where you have placed it).
> $ sudo cp ./xquery-pointer-x /usr/local/bin/
5. Copy the script "logitech-prober.sh" somewhere (preferably to wherever you copied "xquery-pointer-x"), and make note of the location.
> $ sudo cp ./logitech-prober.sh /usr/local/bin/
6. Add the script to your "/etc/rc.local" file, somewhere _above_ the line that says "exit 0" (that's typically the last line of the file).
> $ sudo sed -i '$i /usr/local/bin/logitech-prober.sh' /etc/rc.local
7. Next time you start up your computer, just start wiggling the mouse left and right as soon as the mouse cursor shows up on screen. Once it starts moving, you should be set!

Notes
-----
I realize this is kind of a manual process. I may come up with some sort of install script sometime; I'm just pretty pressed for time these days.