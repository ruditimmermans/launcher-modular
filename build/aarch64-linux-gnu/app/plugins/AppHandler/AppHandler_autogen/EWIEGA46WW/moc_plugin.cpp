/****************************************************************************
** Meta object code from reading C++ file 'plugin.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../../../../../plugins/AppHandler/plugin.h"
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
struct qt_meta_stringdata_AppHandlerPlugin_t {
    QByteArrayData data[1];
    char stringdata0[17];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_AppHandlerPlugin_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_AppHandlerPlugin_t qt_meta_stringdata_AppHandlerPlugin = {
    {
QT_MOC_LITERAL(0, 0, 16) // "AppHandlerPlugin"

    },
    "AppHandlerPlugin"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_AppHandlerPlugin[] = {

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

void AppHandlerPlugin::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

QT_INIT_METAOBJECT const QMetaObject AppHandlerPlugin::staticMetaObject = { {
    &QQmlExtensionPlugin::staticMetaObject,
    qt_meta_stringdata_AppHandlerPlugin.data,
    qt_meta_data_AppHandlerPlugin,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *AppHandlerPlugin::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *AppHandlerPlugin::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_AppHandlerPlugin.stringdata0))
        return static_cast<void*>(this);
    return QQmlExtensionPlugin::qt_metacast(_clname);
}

int AppHandlerPlugin::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
    0x03,  0x70,  'A',  'p',  'p',  'H',  'a',  'n', 
    'd',  'l',  'e',  'r',  'P',  'l',  'u',  'g', 
    'i',  'n', 
    0xff, 
};
QT_MOC_EXPORT_PLUGIN(AppHandlerPlugin, AppHandlerPlugin)

QT_WARNING_POP
QT_END_MOC_NAMESPACE
