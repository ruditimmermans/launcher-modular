#ifndef APPHANDLER_H
#define APPHANDLER_H

#include <QObject>
#include <QString>
#include <QQmlListProperty>
#include "appinfo.h"

class AppHandler: public QObject {
	Q_OBJECT
	Q_PROPERTY(QQmlListProperty<AppInfo> appsinfo READ appsinfo NOTIFY appinfoChanged)
	Q_PROPERTY(QQmlListProperty<AppInfo> fav_appsinfo READ fav_appsinfo NOTIFY fav_appinfoChanged)

public:
	AppHandler();
	~AppHandler() = default;
	QList<AppInfo*> getApps();
	QQmlListProperty<AppInfo> appsinfo();
	QQmlListProperty<AppInfo> fav_appsinfo();

	Q_INVOKABLE void reload();
	Q_INVOKABLE void permaFilter(const QString& key = "Terminal", const QString& regexp = "false");
	Q_INVOKABLE void sort(const QString& key ="Name", bool revertsort = false);
	Q_INVOKABLE void resetTempFilter();
	Q_INVOKABLE void tempFilter(const QString& keys, const QString& regexp, bool caseinsensitive = true);
	Q_INVOKABLE void hideFav();

public slots:
	void setFav(const QString& fav = "");
	void reloadFav();
signals:
	void appinfoChanged();
	void fav_appinfoChanged();
protected:
	QList<AppInfo*> _appinfos;
	QList<AppInfo*> _hideByFilter;
	QList<AppInfo*> _fav_appinfos;
	QString _fav;
	bool _filtering;
private:
	void loadAppsFromDir(const QString& path);
	void loadLibertineAppsFromDir(const QString& path, const QString& container);
	void loadAppsInfo();
	void loadAppsLibertine();
	static void append_appinfo(QQmlListProperty<AppInfo> *list, AppInfo *appinfo);
	static AppInfo* at_appinfo(QQmlListProperty<AppInfo> *list, int at);
	static AppInfo* at_fav_appinfo(QQmlListProperty<AppInfo> *list, int at);
	static int count_appinfo(QQmlListProperty<AppInfo> *list);
	static int count_fav_appinfo(QQmlListProperty<AppInfo> *list);
	static void clear_appinfo(QQmlListProperty<AppInfo> *list);
};
#endif
