#patching /usr/share/unity8/Launcher/Launcher.qml

if [ -z $(grep "launchermodular" /usr/share/unity8/Launcher/Launcher.qml ) ]
then
mount -o rw,remount /
sed -i '/property bool drawerShown/a\readonly property string homeApp: "launchermodular.ubuntouchfr_launchermodular"\
' /usr/share/unity8/Launcher/Launcher.qml

sed -i '/function toggleDrawer/a\/*Add by LM*/\
for(var i=0;i<LauncherModel.rowCount();i++) {\
	if(LauncherModel.get(i).appId == root.homeApp) {\
		drawer.width = units.gu(8);\
		shell.startApp(root.homeApp);\
		return;\
	} else \
		drawer.width = Math.min(root.width, units.gu(81));\
}' /usr/share/unity8/Launcher/Launcher.qml

mount -o ro,remount /
fi
