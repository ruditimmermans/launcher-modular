#include "appinfo.h"
#include <QDebug>
#include <QLocale>

AppInfo::AppInfo(const QString& infos)
{
	import(infos);
	//qDebug() << "keys:" <<_appinfo.keys() << "values" << _appinfo.values();
}

AppInfo::AppInfo(const QString& packagename, const QString& infos)
{
	_appinfo.insert("package_name", packagename);
	_appinfo.insert("Action", "application:///"+packagename+".desktop");
	import(infos);
}
void AppInfo::import(const QString& infos) {
	bool read = false;
	foreach (const QString& line , infos.split("\n")) {
		if(line == "[Desktop Entry]") {
			read = true;
		}
		else if(line.startsWith("[")) {
			read = false;
		}
		else if(line != "" && read) {
			QStringList keyvalue = line.split("="); 
			if(getProp("package_name").contains("morph"))
				qDebug() << keyvalue <<  !_appinfo.contains(keyvalue.first());
			if(!_appinfo.contains(keyvalue.first())) {
				if(!keyvalue.first().contains("["))
					_appinfo.insert(keyvalue.first()+"[]",(keyvalue.size() > 1) ? keyvalue.at(1):"");
				_appinfo.insert(keyvalue.first(),(keyvalue.size() > 1) ? keyvalue.at(1):"");
			}
		}
	}
}
QString AppInfo::getProp(const QString& key)
{
	QString locale = (QLocale() != QLocale::c()) ? QLocale().name().split("_").first() : "c";
    //qDebug() << "locale" <<QLocale().uiLanguages().first() << QLocale().name();
	if ( _appinfo.contains(key+"["+locale+"]") )
	{
		return _appinfo.value(key+"["+locale+"]");
	}
	else
	{
		return _appinfo.value(key); 
	}
    
}
bool AppInfo::haveProp(const QString& key)
{
	return _appinfo.contains(key);
}

void AppInfo::setName(const QString& name) { _appinfo.insert("Name", name); emit nameChanged();}
void AppInfo::setIcon(const QString& icon) { _appinfo.insert("Icon", icon); emit iconChanged();}
void AppInfo::setAction(const QString& action) { _appinfo.insert("Action", action); emit actionChanged();}

QString AppInfo::name() { return getProp("Name");}
QString AppInfo::icon() { return getProp("Icon");}
QString AppInfo::action() { return getProp("Action");}

QVariantMap AppInfo::fullInfo() {
	QVariantMap map;
	foreach(const QString& key, _appinfo.keys()) {
		map.insert(key, _appinfo.value(key));
	}
	return map;
}
QVariantList AppInfo::keys() {
	QVariantList lst;
	foreach(const QString& key, _appinfo.keys()) {
		lst << key;
	}
	return lst;
}
