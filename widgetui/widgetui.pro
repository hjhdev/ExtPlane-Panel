TEMPLATE = app
TARGET = extplane-panel

include(../common.pri)

# Qt Modules
QT += gui network widgets

# Qt Mobility, used to disable screensaver
CONFIG += mobility
CONFIG   -= debug_and_release

MOBILITY += systeminfo

contains(MOBILITY_VERSION, 1.1.1) {
    DEFINES += QTMOBILITY
}


CONFIG(debug, debug|release) {
    # Debug
} else {
    # Release
    DEFINES += QT_NO_DEBUG
    DEFINES += QT_NO_DEBUG_OUTPUT
}

unix: {
    DEFINES += TERMIOS_AVAILABLE
}

android::DEFINES += MOBILE_DEVICE

ICON = ../extplane-panel.icns
DESTDIR = bin
OBJECTS_DIR = build
MOC_DIR = build

target.path = /usr/bin

INSTALLS += target

desktop.files = ../extplane-panel.desktop
desktop.path = /usr/share/applications

unix: INSTALLS += desktop

SOURCES += \
    main.cpp \
    panelitems/panelitem.cpp \
    panelwindow.cpp \
    menubutton.cpp \
    panelitems/needleinstrument.cpp \
    dialogs/settingsdialog.cpp \
    dialogs/edititemdialog.cpp \
    widgets/velocityunitcombobox.cpp \
    widgets/numberinputlineedit.cpp \
    panelitems/di.cpp \
    panelitems/attitudeindicator.cpp \
    panelitems/turnbank.cpp \
    panelitems/hsi_ks55.cpp \
    widgets/distanceunitcombobox.cpp \
    panelitemfactory.cpp \
    needles/needle.cpp \
    needles/triangleneedle.cpp \
    needles/gabalancedneedle.cpp \
    dialogs/panelitemselectiondialog.cpp \
    dialogs/hardwaredialog.cpp \
    panelitems/gpsmap.cpp \
    panelitems/radarmap.cpp \
    panelitems/mapinstrument.cpp \
    panelitems/gaugecover.cpp \
    panel.cpp \
    widgets/colorselector.cpp \
    panelitems/enginedisplay.cpp \
    panelitems/displayinstrument.cpp \
    panelitems/navdisplay.cpp \
    dialogs/panelsdialog.cpp \
    dialogs/bindingcurvedialog.cpp \
    ../settings.cpp \
    ../util/units.cpp \
    ../util/valueinterpolator.cpp \
    ../util/perlinnoise.cpp \
    ../util/interpolation.cpp \
    ../hardware/nulloutputdevice.cpp \
    ../hardware/chromaoutputdevice.cpp \
    ../hardware/outputdevice.cpp \
    ../hardware/servoblasteroutputdevice.cpp \
    ../hardware/pololuoutputdevice.cpp \
    ../hardware/hardwarebinding.cpp \
    ../hardware/hardwaremanager.cpp \
    panelitems/genericlittlegauge.cpp \
    panelitems/pfddisplay.cpp \
    panelitems/indicatordisplay.cpp \
    panelitems/slider.cpp \
    panelitems/wheel.cpp

HEADERS += \
    panelitems/panelitem.h \
    panelwindow.h \
    menubutton.h \
    panelitems/needleinstrument.h \
    dialogs/settingsdialog.h \
    dialogs/edititemdialog.h \
    widgets/velocityunitcombobox.h \
    widgets/numberinputlineedit.h \
    panelitems/di.h \
    panelitems/attitudeindicator.h \
    panelitems/turnbank.h \
    panelitems/hsi_ks55.h \
    widgets/distanceunitcombobox.h \
    panelitemfactory.h \
    needles/needle.h \
    needles/triangleneedle.h \
    needles/gabalancedneedle.h \
    dialogs/panelitemselectiondialog.h \
    dialogs/hardwaredialog.h \
    panelitems/gpsmap.h \
    panelitems/radarmap.h \
    panelitems/mapinstrument.h \
    panelitems/gaugecover.h \
    panel.h \
    widgets/colorselector.h \
    panelitems/enginedisplay.h \
    panelitems/displayinstrument.h \
    panelitems/navdisplay.h \
    dialogs/panelsdialog.h \
    dialogs/bindingcurvedialog.h \
    ../settings.h \
    ../util/valueinterpolator.h \
    ../util/units.h \
    ../util/perlinnoise.h \
    ../util/console.h \
    ../util/interpolation.h \
    ../hardware/nulloutputdevice.h \
    ../hardware/chromaoutputdevice.h \
    ../hardware/outputdevice.h \
    ../hardware/servoblasteroutputdevice.h \
    ../hardware/pololuoutputdevice.h \
    ../hardware/hardwarebinding.h \
    ../hardware/hardwaremanager.h \
    panelitems/genericlittlegauge.h \
    panelitems/pfddisplay.h \
    panelitems/indicatordisplay.h \
    panelitems/slider.h \
    panelitems/wheel.h

FORMS += dialogs/settingsdialog.ui \
    dialogs/edititemdialog.ui \
    dialogs/panelitemselectiondialog.ui \
    dialogs/hardwaredialog.ui \
    dialogs/panelsdialog.ui \
    dialogs/bindingcurvedialog.ui



RESOURCES += ../applicationresources.qrc
