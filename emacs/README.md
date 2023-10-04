# Description
This container is distrobox (should work on toolbx too) container image to run emacs inside the container.

Benefit of this approach is that everything is definined on one place. Also if you have immutable OS, you can avoid layering packages on top which is in general something you should avoid.

# How to

    make base
    make emacs

    distrobox create --image localhost/emacs:39 emacs
    distrobox enter emacs
    distrobox-export --app Emacs
