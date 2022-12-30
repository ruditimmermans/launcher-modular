#include <QDebug>
#include "terminalaccess.h"

Terminalaccess::Terminalaccess() : _proc(), _cmd(), _output(), _err() {
	connect(&_proc,  SIGNAL(readyReadStandardOutput()), this, SLOT(fetchOutput()));
	connect(&_proc,  SIGNAL(readyReadStandardError()), this, SLOT(fetchError()));
	connect(&_proc,  SIGNAL(finished(int, QProcess::ExitStatus)), this, SLOT(procFinished(int, QProcess::ExitStatus)));
}

bool Terminalaccess::run(const QString &cmdline, bool reset_err, bool reset_out) {
	qDebug() << "Running : " << cmdline;
	prepare(cmdline);
	start(reset_err, reset_out);
}
void Terminalaccess::prepare(const QString &cmdline) {
	_cmd = cmdline;
}
bool Terminalaccess::start(bool reset_err, bool reset_out) {
	_proc.kill();
	_proc.waitForFinished();
	if(reset_err)
		_err.clear();
	if(reset_out)
		_output.clear();
	_proc.start("sh", QStringList() << "-c" << _cmd);
	if(!_proc.waitForStarted()) {
		qDebug() << "Process fail to start :" << _cmd;
		return false;
	}
	return true;
}
QString Terminalaccess::outputUntilEnd() {
	if (!_proc.waitForFinished()) {
	    qDebug() << "ERROR RUNNING " << _cmd <<" : " << _proc.errorString();
		qDebug() << _proc.readAllStandardError() << _err;
		return getNewOutput();
	}
	else {
		qDebug() << _proc.readAllStandardError();
	    QString ret = getNewOutput()+_proc.readAll();
	    //qDebug() << "CMD RETURN : " << ret;
	    qDebug() << "CMD RETURN SUCCESS";
	    return ret;
	}
}
QString Terminalaccess::getNewOutput() {
	QString newoutput = _output;
	_output = "";
	return newoutput;
}
QString Terminalaccess::getNewError() {
	QString newerror = _err;
	_err = "";
	return newerror;
}
void Terminalaccess::fetchError() {
	QString newerr=QString::fromLocal8Bit(_proc.readAllStandardError());
	if(newerr == "[sudo] password for phablet: ") {
		emit(needSudoPassword());
	}
	_err+=newerr;
	qDebug() << "SLOT ERR : " << _err;
	if(newerr.contains("\n"))
		emit(newErrorLineAvailable());
	emit(newErrorAvailable());
}
void Terminalaccess::fetchOutput() {
	QString newout = QString::fromLocal8Bit(_proc.readAllStandardOutput());
	_output+=newout;
	//qDebug() << "SLOT READ : " << _output;
	if(newout.contains("\n"))
		emit(newOutputLineAvailable());
	emit(newOutputAvailable());
}
bool Terminalaccess::input(QString newinput, bool printDebug) {
	//if(printDebug)
	//	qDebug() << "SLOT WRITE : " << newinput;
	if(_proc.write(newinput.toLocal8Bit()))
		return true;
	return false;
}
bool Terminalaccess::inputLine(QString newinput, bool printDebug) {
	return input(newinput+"\n", printDebug);
}
void Terminalaccess::procFinished(int exitcode, QProcess::ExitStatus es) {
	qDebug() << "FINISHED" << exitcode;
	emit(finished(exitcode));
}
