# steamos-java
Make Java usable in SteamOS by aliasing `java` to the path of a Java executable.

Intended use with the official Minecraft Launcher (available via Flathub - findable in Discover) but should work with anything else that uses Java.

Basically, just have anything Java-based installed and this script _should_ find it and create an alias in your `~/.bashrc` to call it.

This will persist across SteamOS updates since your home directory (/home/deck) is never affected.
The only way your alias could really break is if you then uninstall the program that this script found as a source of Java.
In that case, re-run this script; it'll remove the old alias and re-create a new one (assuming you have any Javas left).
