Local copy of https://github.com/coldfix/setcapslock. Original README follows:


setcapslock
===========

Small utility to set the caps lock state in an X session.

The ``setcaps`` function is stolen from here: http://askubuntu.com/a/80301


Usage
~~~~~

Turn caps lock on::

    setcapslock on

Turn caps lock off::

    setcapslock off


Install
~~~~~~~

To build the binary type::

    make


Alternatives
~~~~~~~~~~~~

I came by the following suggestions for alternative solutions (none of which
ended up working for me):

* ``setleds -caps``
  (setleds complains about not being in a virtual terminal)

* ``xkbset nullify -lock``
  (I don't have xkbset in repositories, so cannot verify)

* ``xset led named 'Caps Lock'``
  (does not work for caps lock on my machine)


Turn off the key
~~~~~~~~~~~~~~~~

Beware, this utility does NOT turn of your caps lock *key*. For this task
I found either of the following commands sufficient:

* ``setxkbmap -option caps:none``
  (or even better use "caps:escape" to reassign to escape key!)
  (see: http://unix.stackexchange.com/a/75492)

* ``xmodmap -e "clear Lock" -e "keysym Caps_Lock = Escape"``
  (the statements can also be put into .Xmodmap config file)


Toggle caps lock
~~~~~~~~~~~~~~~~

According to `this post`_ the following commands can be used to toggle the
caps lock state:

* ``xdotool key Caps_Lock`` (works for me!)

* ``xte "key Caps_Lock"`` (``xte`` is in the ``xautomation`` package but
  complains about bad parameter on my machine)


.. _this post: http://askubuntu.com/a/607915
