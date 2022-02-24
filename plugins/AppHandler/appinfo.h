#ifndef APPINFO_H
#define APPINFO_H

#include <QObject>
#include <QString>
#include <QMap>
#include <QVariantMap>
#include <QVariantList>

class AppInfo: public QObject {
	Q_OBJECT
	Q_PROPERTY( QString name READ name WRITE setName NOTIFY nameChanged)
	Q_PROPERTY( QString icon READ icon WRITE setIcon NOTIFY iconChanged)
	Q_PROPERTY( QString action READ action WRITE setAction NOTIFY actionChanged)

public:
	~AppInfo() = default;
	AppInfo(const QString& infos = "");
	AppInfo(const QString &packageName, const QString& infos);
	Q_INVOKABLE QString getProp(const QString& key);
	Q_INVOKABLE bool haveProp(const QString& key);
	Q_INVOKABLE void import(const QString& infos);
	Q_INVOKABLE QVariantMap fullInfo();
	Q_INVOKABLE QVariantList keys();
	QString name();
	QString icon();
	QString action();
public slots:
	void setName(const QString&);
	void setIcon(const QString&);
	void setAction(const QString&);
signals:
	void nameChanged();
	void iconChanged();
	void actionChanged();	
protected:
	QMap<QString, QString> _appinfo;	
};

#endif
