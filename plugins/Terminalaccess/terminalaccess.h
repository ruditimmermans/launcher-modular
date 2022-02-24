#ifndef TERMINALACCESS_H
#define TERMINALACCESS_H

#include <QObject>
#include <QString>
#include <QProcess>

class Terminalaccess: public QObject {
    Q_OBJECT

public:
    Terminalaccess();
    ~Terminalaccess() = default;

    Q_INVOKABLE bool run(const QString &cmdline, bool reset_err = true, bool reset_out = true);
    Q_INVOKABLE void prepare(const QString &cmdline);
    Q_INVOKABLE bool start(bool reset_err = true, bool reset_out = true);
    Q_INVOKABLE QString getNewOutput();
    Q_INVOKABLE QString getNewError();
    Q_INVOKABLE QString outputUntilEnd();
    Q_INVOKABLE bool input(QString input, bool print = true);
    Q_INVOKABLE bool inputLine(QString input, bool print = true);
public slots:
    void fetchOutput();
    void fetchError();
    void procFinished(int, QProcess::ExitStatus);

signals:
    void newOutputAvailable();
    void newOutputLineAvailable();
    void newErrorAvailable();
    void newErrorLineAvailable();
    void needSudoPassword();
    void finished(int exitcode);

protected:
    QProcess _proc;
    QString _cmd;
    QString _output;
    QString _err;
};

#endif
