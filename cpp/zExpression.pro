TEMPLATE = app

CONFIG += console
CONFIG -= qt
CONFIG -= app_bundle

SOURCES += \
    sample.cpp \
    variable_node.cpp \
    errors.cpp \
    number_node.cpp \
    astree/variable_node.cpp \
    astree/number_node.cpp

HEADERS += \
    node.h \
    containers.h \
    config.h \
    variable_node.h \
    errors.h \
    number_node.h \
    astree/variable_node.h \
    astree/number_node.h \
    astree/node.h

QMAKE_CXXFLAGS += -v -mmacosx-version-min=10.7
QMAKE_LFLAGS += -mmacosx-version-min=10.7

