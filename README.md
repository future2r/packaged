Packaged
========

This project demonstrates how to create an application image and an platform-specific installer with `jpackage`.

Windows Application Icon
------------------------

For the Windows image creation, the icon is required to be in Windows ICO format.

The icon for this application was created with [X-Icon Editor](https://xiconeditor.com).

![](install/windows/application.ico)

Windows Installer Resources
---------------------------

For Windows, the [WiX Toolset](https://wixtoolset.org) is used by `jpackage`. The resources used by this tool can be overridden by specifying a resource directory with `--resource-dir`.

In this project the WiX resources can be found in `./install/windows/wix`.