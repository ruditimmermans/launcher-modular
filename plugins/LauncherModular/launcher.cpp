#include <QDebug>
#include <QDirIterator>
#include <QStandardPaths>
#include <QCoreApplication>

#include "launcher.h"


LauncherModularPlug::LauncherModularPlug() {
    m_dashOverride = QStringLiteral("%1/upstart/launchermodular.conf").arg(
        QStandardPaths::writableLocation(QStandardPaths::ConfigLocation)
    );

    m_isDashSet = getIsDashSet();
    Q_EMIT isDashSetChanged();
}

bool LauncherModularPlug::isDashSet() const {
    return m_isDashSet;
}

bool LauncherModularPlug::getIsDashSet() {
    QFile file(m_dashOverride);
    if(!file.exists())
	    return false;
    else {
	QFile file(m_dashOverride);
    	if (!file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        	return false;
	}
	QTextStream in(&file);
	while(!in.atEnd()) {
		QString line = in.readLine();
		if(line.contains("BINARY")) {
		       if(line.contains("launchermodular.ubuntouchfr")) {
			       file.close();
				return true;
			}
			else
			{
				file.close();
				return false;
			}
		}
	}
	file.close();
    }
    return true;
}

bool LauncherModularPlug::setDash() {
    QFile file(m_dashOverride);
    if (!file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        return false;
    }

    QTextStream out(&file);

    out << "env BINARY=/opt/click.ubuntu.com/launchermodular.ubuntouchfr/current/launchermodular" << endl;
    out << "env APP_DIR=/opt/click.ubuntu.com/.click/users/phablet/launchermodular.ubuntouchfr" << endl;
    out << "env XDG_CONFIG_HOME=/home/phablet/.config" << endl;
    out << "env XDG_DATA_HOME=/home/phablet/.local/share" << endl;
    out << "env APP_DESKTOP_FILE_PATH=/opt/click.ubuntu.com/.click/users/phablet/launchermodular.ubuntouchfr/launchermodular.desktop"<< endl;
    out << "start on started unity8" << endl;
    out << "stop on stopping unity8" << endl;
    out << "kill timeout 240" << endl;
    out << "respawn" << endl;
    out << "respawn limit unlimited" << endl;

    out << "script" << endl;
    out << "	APP_ID=$(ubuntu-app-launch-appids | grep launchermodular.ubuntouchfr)" << endl;
    out << "	ubuntu-app-launch $APP_ID && tail -f /proc/$(ubuntu-app-pid $APP_ID)/fd/1 2> /dev/null" << endl;
    out << "end script" << endl;
        
    file.close();

    m_isDashSet = true;
    Q_EMIT isDashSetChanged();

    return true;
}

bool LauncherModularPlug::unsetDash() {
    QFile file(m_dashOverride);
    if (!file.remove()) {
        return false;
    }

    m_isDashSet = false;
    Q_EMIT isDashSetChanged();

    return true;
}
