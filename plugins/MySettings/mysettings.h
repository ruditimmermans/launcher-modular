#ifndef MYSETTINGS_H
#define MYSETTINGS_H

#include <QString>
#include "accountsservice.h"

class MySettings: public QObject {
	Q_OBJECT

public:
	MySettings();
	~MySettings() = default;
	Q_INVOKABLE QString getBackgroundFile();
public slots:
	void setBackgroundFile(const QString &filename);
signals:
	void backgroundFileChanged();
protected:
	AccountsService _acc;	
};
#endif
