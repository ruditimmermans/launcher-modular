/****************************************************************************
** Meta object code from reading C++ file 'terminalaccess.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../plugins/Terminalaccess/terminalaccess.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'terminalaccess.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Terminalaccess_t {
    QByteArrayData data[25];
    char stringdata0[298];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Terminalaccess_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Terminalaccess_t qt_meta_stringdata_Terminalaccess = {
    {
QT_MOC_LITERAL(0, 0, 14), // "Terminalaccess"
QT_MOC_LITERAL(1, 15, 18), // "newOutputAvailable"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 22), // "newOutputLineAvailable"
QT_MOC_LITERAL(4, 58, 17), // "newErrorAvailable"
QT_MOC_LITERAL(5, 76, 21), // "newErrorLineAvailable"
QT_MOC_LITERAL(6, 98, 16), // "needSudoPassword"
QT_MOC_LITERAL(7, 115, 8), // "finished"
QT_MOC_LITERAL(8, 124, 8), // "exitcode"
QT_MOC_LITERAL(9, 133, 11), // "fetchOutput"
QT_MOC_LITERAL(10, 145, 10), // "fetchError"
QT_MOC_LITERAL(11, 156, 12), // "procFinished"
QT_MOC_LITERAL(12, 169, 20), // "QProcess::ExitStatus"
QT_MOC_LITERAL(13, 190, 3), // "run"
QT_MOC_LITERAL(14, 194, 7), // "cmdline"
QT_MOC_LITERAL(15, 202, 9), // "reset_err"
QT_MOC_LITERAL(16, 212, 9), // "reset_out"
QT_MOC_LITERAL(17, 222, 7), // "prepare"
QT_MOC_LITERAL(18, 230, 5), // "start"
QT_MOC_LITERAL(19, 236, 12), // "getNewOutput"
QT_MOC_LITERAL(20, 249, 11), // "getNewError"
QT_MOC_LITERAL(21, 261, 14), // "outputUntilEnd"
QT_MOC_LITERAL(22, 276, 5), // "input"
QT_MOC_LITERAL(23, 282, 5), // "print"
QT_MOC_LITERAL(24, 288, 9) // "inputLine"

    },
    "Terminalaccess\0newOutputAvailable\0\0"
    "newOutputLineAvailable\0newErrorAvailable\0"
    "newErrorLineAvailable\0needSudoPassword\0"
    "finished\0exitcode\0fetchOutput\0fetchError\0"
    "procFinished\0QProcess::ExitStatus\0run\0"
    "cmdline\0reset_err\0reset_out\0prepare\0"
    "start\0getNewOutput\0getNewError\0"
    "outputUntilEnd\0input\0print\0inputLine"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Terminalaccess[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      23,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  129,    2, 0x06 /* Public */,
       3,    0,  130,    2, 0x06 /* Public */,
       4,    0,  131,    2, 0x06 /* Public */,
       5,    0,  132,    2, 0x06 /* Public */,
       6,    0,  133,    2, 0x06 /* Public */,
       7,    1,  134,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       9,    0,  137,    2, 0x0a /* Public */,
      10,    0,  138,    2, 0x0a /* Public */,
      11,    2,  139,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      13,    3,  144,    2, 0x02 /* Public */,
      13,    2,  151,    2, 0x22 /* Public | MethodCloned */,
      13,    1,  156,    2, 0x22 /* Public | MethodCloned */,
      17,    1,  159,    2, 0x02 /* Public */,
      18,    2,  162,    2, 0x02 /* Public */,
      18,    1,  167,    2, 0x22 /* Public | MethodCloned */,
      18,    0,  170,    2, 0x22 /* Public | MethodCloned */,
      19,    0,  171,    2, 0x02 /* Public */,
      20,    0,  172,    2, 0x02 /* Public */,
      21,    0,  173,    2, 0x02 /* Public */,
      22,    2,  174,    2, 0x02 /* Public */,
      22,    1,  179,    2, 0x22 /* Public | MethodCloned */,
      24,    2,  182,    2, 0x02 /* Public */,
      24,    1,  187,    2, 0x22 /* Public | MethodCloned */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,    8,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int, 0x80000000 | 12,    2,    2,

 // methods: parameters
    QMetaType::Bool, QMetaType::QString, QMetaType::Bool, QMetaType::Bool,   14,   15,   16,
    QMetaType::Bool, QMetaType::QString, QMetaType::Bool,   14,   15,
    QMetaType::Bool, QMetaType::QString,   14,
    QMetaType::Void, QMetaType::QString,   14,
    QMetaType::Bool, QMetaType::Bool, QMetaType::Bool,   15,   16,
    QMetaType::Bool, QMetaType::Bool,   15,
    QMetaType::Bool,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::QString,
    QMetaType::Bool, QMetaType::QString, QMetaType::Bool,   22,   23,
    QMetaType::Bool, QMetaType::QString,   22,
    QMetaType::Bool, QMetaType::QString, QMetaType::Bool,   22,   23,
    QMetaType::Bool, QMetaType::QString,   22,

       0        // eod
};

void Terminalaccess::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Terminalaccess *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->newOutputAvailable(); break;
        case 1: _t->newOutputLineAvailable(); break;
        case 2: _t->newErrorAvailable(); break;
        case 3: _t->newErrorLineAvailable(); break;
        case 4: _t->needSudoPassword(); break;
        case 5: _t->finished((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->fetchOutput(); break;
        case 7: _t->fetchError(); break;
        case 8: _t->procFinished((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QProcess::ExitStatus(*)>(_a[2]))); break;
        case 9: { bool _r = _t->run((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 10: { bool _r = _t->run((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 11: { bool _r = _t->run((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 12: _t->prepare((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 13: { bool _r = _t->start((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 14: { bool _r = _t->start((*reinterpret_cast< bool(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 15: { bool _r = _t->start();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 16: { QString _r = _t->getNewOutput();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 17: { QString _r = _t->getNewError();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 18: { QString _r = _t->outputUntilEnd();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 19: { bool _r = _t->input((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 20: { bool _r = _t->input((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 21: { bool _r = _t->inputLine((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 22: { bool _r = _t->inputLine((*reinterpret_cast< QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Terminalaccess::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Terminalaccess::newOutputAvailable)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Terminalaccess::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Terminalaccess::newOutputLineAvailable)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Terminalaccess::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Terminalaccess::newErrorAvailable)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Terminalaccess::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Terminalaccess::newErrorLineAvailable)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Terminalaccess::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Terminalaccess::needSudoPassword)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (Terminalaccess::*)(int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Terminalaccess::finished)) {
                *result = 5;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject Terminalaccess::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_Terminalaccess.data,
    qt_meta_data_Terminalaccess,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Terminalaccess::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Terminalaccess::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Terminalaccess.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Terminalaccess::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 23)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 23;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 23)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 23;
    }
    return _id;
}

// SIGNAL 0
void Terminalaccess::newOutputAvailable()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Terminalaccess::newOutputLineAvailable()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Terminalaccess::newErrorAvailable()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Terminalaccess::newErrorLineAvailable()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Terminalaccess::needSudoPassword()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void Terminalaccess::finished(int _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 5, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
