TEMPLATE = app

CONFIG += console
CONFIG -= qt
CONFIG -= app_bundle

SOURCES += \
    sample.cpp \
    errors.cpp \
    astree/variable_node.cpp \
    astree/number_node.cpp \
    astree/function_node.cpp

HEADERS += \
    node.h \
    containers.h \
    config.h \
    errors.h \
    astree/variable_node.h \
    astree/number_node.h \
    astree/node.h \
    astree/function_node.h

QMAKE_CXXFLAGS += -mmacosx-version-min=10.7
QMAKE_LFLAGS += -mmacosx-version-min=10.7

