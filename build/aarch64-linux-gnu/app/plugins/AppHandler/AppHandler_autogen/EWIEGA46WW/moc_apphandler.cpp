/****************************************************************************
** Meta object code from reading C++ file 'apphandler.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../plugins/AppHandler/apphandler.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'apphandler.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AppHandler_t {
    QByteArrayData data[21];
    char stringdata0[217];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AppHandler_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AppHandler_t qt_meta_stringdata_AppHandler = {
    {
QT_MOC_LITERAL(0, 0, 10), // "AppHandler"
QT_MOC_LITERAL(1, 11, 14), // "appinfoChanged"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 18), // "fav_appinfoChanged"
QT_MOC_LITERAL(4, 46, 6), // "setFav"
QT_MOC_LITERAL(5, 53, 3), // "fav"
QT_MOC_LITERAL(6, 57, 9), // "reloadFav"
QT_MOC_LITERAL(7, 67, 6), // "reload"
QT_MOC_LITERAL(8, 74, 11), // "permaFilter"
QT_MOC_LITERAL(9, 86, 3), // "key"
QT_MOC_LITERAL(10, 90, 6), // "regexp"
QT_MOC_LITERAL(11, 97, 4), // "sort"
QT_MOC_LITERAL(12, 102, 10), // "revertsort"
QT_MOC_LITERAL(13, 113, 15), // "resetTempFilter"
QT_MOC_LITERAL(14, 129, 10), // "tempFilter"
QT_MOC_LITERAL(15, 140, 4), // "keys"
QT_MOC_LITERAL(16, 145, 15), // "caseinsensitive"
QT_MOC_LITERAL(17, 161, 7), // "hideFav"
QT_MOC_LITERAL(18, 169, 8), // "appsinfo"
QT_MOC_LITERAL(19, 178, 25), // "QQmlListProperty<AppInfo>"
QT_MOC_LITERAL(20, 204, 12) // "fav_appsinfo"

    },
    "AppHandler\0appinfoChanged\0\0"
    "fav_appinfoChanged\0setFav\0fav\0reloadFav\0"
    "reload\0permaFilter\0key\0regexp\0sort\0"
    "revertsort\0resetTempFilter\0tempFilter\0"
    "keys\0caseinsensitive\0hideFav\0appsinfo\0"
    "QQmlListProperty<AppInfo>\0fav_appsinfo"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AppHandler[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      16,   14, // methods
       2,  134, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   94,    2, 0x06 /* Public */,
       3,    0,   95,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    1,   96,    2, 0x0a /* Public */,
       4,    0,   99,    2, 0x2a /* Public | MethodCloned */,
       6,    0,  100,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       7,    0,  101,    2, 0x02 /* Public */,
       8,    2,  102,    2, 0x02 /* Public */,
       8,    1,  107,    2, 0x22 /* Public | MethodCloned */,
       8,    0,  110,    2, 0x22 /* Public | MethodCloned */,
      11,    2,  111,    2, 0x02 /* Public */,
      11,    1,  116,    2, 0x22 /* Public | MethodCloned */,
      11,    0,  119,    2, 0x22 /* Public | MethodCloned */,
      13,    0,  120,    2, 0x02 /* Public */,
      14,    3,  121,    2, 0x02 /* Public */,
      14,    2,  128,    2, 0x22 /* Public | MethodCloned */,
      17,    0,  133,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    5,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    9,   10,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,    9,   12,
    QMetaType::Void, QMetaType::QString,    9,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Bool,   15,   10,   16,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   15,   10,
    QMetaType::Void,

 // properties: name, type, flags
      18, 0x80000000 | 19, 0x00495009,
      20, 0x80000000 | 19, 0x00495009,

 // properties: notify_signal_id
       0,
       1,

       0        // eod
};

void AppHandler::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AppHandler *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->appinfoChanged(); break;
        case 1: _t->fav_appinfoChanged(); break;
        case 2: _t->setFav((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 3: _t->setFav(); break;
        case 4: _t->reloadFav(); break;
        case 5: _t->reload(); break;
        case 6: _t->permaFilter((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 7: _t->permaFilter((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 8: _t->permaFilter(); break;
        case 9: _t->sort((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 10: _t->sort((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 11: _t->sort(); break;
        case 12: _t->resetTempFilter(); break;
        case 13: _t->tempFilter((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< bool(*)>(_a[3]))); break;
        case 14: _t->tempFilter((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 15: _t->hideFav(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AppHandler::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AppHandler::appinfoChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AppHandler::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AppHandler::fav_appinfoChanged)) {
                *result = 1;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<AppHandler *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QQmlListProperty<AppInfo>*>(_v) = _t->appsinfo(); break;
        case 1: *reinterpret_cast< QQmlListProperty<AppInfo>*>(_v) = _t->fav_appsinfo(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject AppHandler::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_AppHandler.data,
    qt_meta_data_AppHandler,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AppHandler::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AppHandler::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AppHandler.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AppHandler::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 16)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 16;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 16)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 16;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AppHandler::appinfoChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void AppHandler::fav_appinfoChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
