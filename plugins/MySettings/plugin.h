#ifndef MYSETTINGSPLUGIN_H
#define MYSETTINGSPLUGIN_H

#include <QQmlExtensionPlugin>

class MySettingsPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif
