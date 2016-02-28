CXX=i686-w64-mingw32-g++
TARGET_DIR=./build/
TARGET=libkmsjsonrpc.dll

CFLAGS= \
-I./src/jsonrpc/

SRC= \
./src/JsonFixes.cpp \
./src/JsonRpcHandler.cpp \
./src/JsonRpcClient.cpp \
./src/JsonRpcUtils.cpp

LIBS= \
-L/usr/i686-w64-mingw32/sys-root/mingw/lib \
-L/usr/lib/gcc/i686-w64-mingw32/5.2.0 \
-L/usr/i686-w64-mingw32/lib/

all:
	mkdir -p $(TARGET_DIR)
	$(CXX) -shared -o $(TARGET_DIR)/$(TARGET) $(CFLAGS) $(SRC) $(LIBS) -Wl,--out-implib,$(TARGET_DIR)/$(TARGET).a

.PHONY: clean
clean:
	rm $(TARGET_DIR)/$(TARGET)
	rm $(TARGET_DIR)/$(TARGET).a

