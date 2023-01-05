/****************************************************************************
** Meta object code from reading C++ file 'accountsservice.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../plugins/MySettings/accountsservice.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'accountsservice.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_AccountsService_t {
    QByteArrayData data[9];
    char stringdata0[110];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AccountsService_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AccountsService_t qt_meta_stringdata_AccountsService = {
    {
QT_MOC_LITERAL(0, 0, 15), // "AccountsService"
QT_MOC_LITERAL(1, 16, 15), // "propertyChanged"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 9), // "interface"
QT_MOC_LITERAL(4, 43, 8), // "property"
QT_MOC_LITERAL(5, 52, 7), // "changed"
QT_MOC_LITERAL(6, 60, 16), // "nameOwnerChanged"
QT_MOC_LITERAL(7, 77, 11), // "slotChanged"
QT_MOC_LITERAL(8, 89, 20) // "slotNameOwnerChanged"

    },
    "AccountsService\0propertyChanged\0\0"
    "interface\0property\0changed\0nameOwnerChanged\0"
    "slotChanged\0slotNameOwnerChanged"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AccountsService[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    2,   39,    2, 0x06 /* Public */,
       5,    0,   44,    2, 0x06 /* Public */,
       6,    0,   45,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       7,    3,   46,    2, 0x0a /* Public */,
       8,    3,   53,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString,    3,    4,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QVariantMap, QMetaType::QStringList,    2,    2,    2,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    2,    2,    2,

       0        // eod
};

void AccountsService::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<AccountsService *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->propertyChanged((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 1: _t->changed(); break;
        case 2: _t->nameOwnerChanged(); break;
        case 3: _t->slotChanged((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QVariantMap(*)>(_a[2])),(*reinterpret_cast< QStringList(*)>(_a[3]))); break;
        case 4: _t->slotNameOwnerChanged((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (AccountsService::*)(QString , QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AccountsService::propertyChanged)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (AccountsService::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AccountsService::changed)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (AccountsService::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&AccountsService::nameOwnerChanged)) {
                *result = 2;
                return;
            }
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject AccountsService::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_AccountsService.data,
    qt_meta_data_AccountsService,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AccountsService::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AccountsService::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AccountsService.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int AccountsService::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void AccountsService::propertyChanged(QString _t1, QString _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void AccountsService::changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void AccountsService::nameOwnerChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
