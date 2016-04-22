CXX=i686-w64-mingw32-g++
TARGET_DIR=./build/
TARGET=libkmsjsonrpc.dll

ifdef DEBUG
CXX += -g -o0
TARGET_DIR = ./build/debug/
endif

CXXFLAGS=--std=gnu++17 -fpermissive

CFLAGS= \
-I./src/jsonrpc/ \
-I../jsoncpp/include/

SRC= \
./src/JsonFixes.cpp \
./src/JsonRpcHandler.cpp \
./src/JsonRpcClient.cpp \
./src/JsonRpcUtils.cpp

LIBS= \
-L../jsoncpp/build \
-lkmsjsoncpp.dll

all:
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $(TARGET_DIR)/$(TARGET) $(CFLAGS) $(CXXFLAGS) $(SRC) $(LIBS) -Wl,--out-implib,$(TARGET_DIR)/$(TARGET).a

.PHONY: clean
clean:
	rm $(TARGET_DIR)/$(TARGET)
	rm $(TARGET_DIR)/$(TARGET).a

