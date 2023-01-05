/****************************************************************************
** Meta object code from reading C++ file 'appinfo.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../plugins/AppHandler/appinfo.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'appinfo.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AppInfo_t {
    QByteArrayData data[18];
    char stringdata0[138];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AppInfo_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AppInfo_t qt_meta_stringdata_AppInfo = {
    {
QT_MOC_LITERAL(0, 0, 7), // "AppInfo"
QT_MOC_LITERAL(1, 8, 11), // "nameChanged"
QT_MOC_LITERAL(2, 20, 0), // ""
QT_MOC_LITERAL(3, 21, 11), // "iconChanged"
QT_MOC_LITERAL(4, 33, 13), // "actionChanged"
QT_MOC_LITERAL(5, 47, 7), // "setName"
QT_MOC_LITERAL(6, 55, 7), // "setIcon"
QT_MOC_LITERAL(7, 63, 9), // "setAction"
QT_MOC_LITERAL(8, 73, 7), // "getProp"
QT_MOC_LITERAL(9, 81, 3), // "key"
QT_MOC_LITERAL(10, 85, 8), // "haveProp"
QT_MOC_LITERAL(11, 94, 6), // "import"
QT_MOC_LITERAL(12, 101, 5), // "infos"
QT_MOC_LITERAL(13, 107, 8), // "fullInfo"
QT_MOC_LITERAL(14, 116, 4), // "keys"
QT_MOC_LITERAL(15, 121, 4), // "name"
QT_MOC_LITERAL(16, 126, 4), // "icon"
QT_MOC_LITERAL(17, 131, 6) // "action"

    },
    "AppInfo\0nameChanged\0\0iconChanged\0"
    "actionChanged\0setName\0setIcon\0setAction\0"
    "getProp\0key\0haveProp\0import\0infos\0"
    "fullInfo\0keys\0name\0icon\0action"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AppInfo[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       3,   92, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   69,    2, 0x06 /* Public */,
       3,    0,   70,    2, 0x06 /* Public */,
       4,    0,   71,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    1,   72,    2, 0x0a /* Public */,
       6,    1,   75,    2, 0x0a /* Public */,
       7,    1,   78,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       8,    1,   81,    2, 0x02 /* Public */,
      10,    1,   84,    2, 0x02 /* Public */,
      11,    1,   87,    2, 0x02 /* Public */,
      13,    0,   90,    2, 0x02 /* Public */,
      14,    0,   91,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,
    QMetaType::Void, QMetaType::QString,    2,

 // methods: parameters
    QMetaType::QString, QMetaType::QString,    9,
    QMetaType::Bool, QMetaType::QString,    9,
    QMetaType::Void, QMetaType::QString,   12,
    QMetaType::QVariantMap,
    QMetaType::QVariantList,

 // properties: name, type, flags
      15, QMetaType::QString, 0x00495103,
      16, QMetaType::QString, 0x00495103,
      17, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,

       0        // eod
};

void AppInfo::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AppInfo *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->nameChanged(); break;
        case 1: _t->iconChanged(); break;
        case 2: _t->actionChanged(); break;
        case 3: _t->setName((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 4: _t->setIcon((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 5: _t->setAction((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 6: { QString _r = _t->getProp((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 7: { bool _r = _t->haveProp((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 8: _t->import((*reinterpret_cast< const QString(*)>(_a[1]))); break;
        case 9: { QVariantMap _r = _t->fullInfo();
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = std::move(_r); }  break;
        case 10: { QVariantList _r = _t->keys();
            if (_a[0]) *reinterpret_cast< QVariantList*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AppInfo::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AppInfo::nameChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AppInfo::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AppInfo::iconChanged)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (AppInfo::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AppInfo::actionChanged)) {
                *result = 2;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<AppInfo *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->name(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->icon(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->action(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<AppInfo *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setName(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setIcon(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setAction(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject AppInfo::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_AppInfo.data,
    qt_meta_data_AppInfo,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AppInfo::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AppInfo::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AppInfo.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AppInfo::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void AppInfo::nameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void AppInfo::iconChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void AppInfo::actionChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
