#ifndef LAUNCHERMODULARPLUGIN_H
#define LAUNCHERMODULARPLUGIN_H

#include <QQmlExtensionPlugin>

class LauncherModularPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif
