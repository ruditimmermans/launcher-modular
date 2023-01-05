/****************************************************************************
** Meta object code from reading C++ file 'plugin.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../plugins/MySettings/plugin.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/qplugin.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'plugin.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_MySettingsPlugin_t {
    QByteArrayData data[1];
    char stringdata0[17];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MySettingsPlugin_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MySettingsPlugin_t qt_meta_stringdata_MySettingsPlugin = {
    {
QT_MOC_LITERAL(0, 0, 16) // "MySettingsPlugin"

    },
    "MySettingsPlugin"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MySettingsPlugin[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

void MySettingsPlugin::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject MySettingsPlugin::staticMetaObject = { {
    &QQmlExtensionPlugin::staticMetaObject,
    qt_meta_stringdata_MySettingsPlugin.data,
    qt_meta_data_MySettingsPlugin,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *MySettingsPlugin::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MySettingsPlugin::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_MySettingsPlugin.stringdata0))
        return static_cast<void*>(this);
    return QQmlExtensionPlugin::qt_metacast(_clname);
}

int MySettingsPlugin::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQmlExtensionPlugin::qt_metacall(_c, _id, _a);
    return _id;
}

QT_PLUGIN_METADATA_SECTION
static constexpr unsigned char qt_pluginMetaData[] = {
    'Q', 'T', 'M', 'E', 'T', 'A', 'D', 'A', 'T', 'A', ' ', '!',
    // metadata version, Qt version, architectural requirements
    0, QT_VERSION_MAJOR, QT_VERSION_MINOR, qPluginArchRequirements(),
    0xbf, 
    // "IID"
    0x02,  0x78,  0x28,  'o',  'r',  'g',  '.',  'q', 
    't',  '-',  'p',  'r',  'o',  'j',  'e',  'c', 
    't',  '.',  'Q',  't',  '.',  'Q',  'Q',  'm', 
    'l',  'E',  'x',  't',  'e',  'n',  's',  'i', 
    'o',  'n',  'I',  'n',  't',  'e',  'r',  'f', 
    'a',  'c',  'e', 
    // "className"
    0x03,  0x70,  'M',  'y',  'S',  'e',  't',  't', 
    'i',  'n',  'g',  's',  'P',  'l',  'u',  'g', 
    'i',  'n', 
    0xff, 
};
QT_MOC_EXPORT_PLUGIN(MySettingsPlugin, MySettingsPlugin)

QT_WARNING_POP
QT_END_MOC_NAMESPACE
