#ifndef TERMINALACCESSPLUGIN_H
#define TERMINALACCESSPLUGIN_H

#include <QQmlExtensionPlugin>

class TerminalaccessPlugin : public QQmlExtensionPlugin {
    Q_OBJECT
    Q_PLUGIN_METADATA(IID "org.qt-project.Qt.QQmlExtensionInterface")

public:
    void registerTypes(const char *uri);
};

#endif
