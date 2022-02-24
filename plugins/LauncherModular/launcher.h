#ifndef LAUNCHER_H
#define LAUNCHER_H

#include <QObject>
#include <QDir>
#include <QQmlListProperty>
#include <QProcess>
#include <QSettings>


class LauncherModularPlug: public QObject {
    Q_OBJECT
    Q_PROPERTY(bool isDashSet READ isDashSet NOTIFY isDashSetChanged)

public:
    LauncherModularPlug();
	~LauncherModularPlug() = default;

    Q_INVOKABLE bool setDash();
    Q_INVOKABLE bool unsetDash();

    bool isDashSet() const;
    bool getIsDashSet();

Q_SIGNALS:
    void isDashSetChanged();

private:
    QSettings m_settings;
    int m_numLauncher = 0;
    bool m_isDashSet = false;
    QString m_dashOverride;
};

#endif
