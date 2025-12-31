# Makefile for WindowsPaint using g++
# Windows GUI application using Win32 API

# Compiler and linker
CXX = g++
WINDRES = windres

# Compiler flags
CXXFLAGS = -Wall -Wextra -std=c++11 -O2

# Linker flags
LDFLAGS = -mwindows -static-libgcc -static-libstdc++

# Windows libraries
LIBS = -lgdi32 -luser32 -lcomctl32

# Source files
SOURCES = Project1.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Resource files (disabled due to encoding issues - can be re-enabled if needed)
# RESOURCES = Project1.rc
# RES_OBJ = $(RESOURCES:.rc=.o)
RES_OBJ =

# Target executable
TARGET = WindowsPaint.exe

# Default target
all: $(TARGET)

# Link executable
$(TARGET): $(OBJECTS) $(RES_OBJ)
	$(CXX) $(LDFLAGS) -o $@ $(OBJECTS) $(RES_OBJ) $(LIBS)
	@echo "Build successful: $(TARGET)"

# Compile source files
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Compile resource files (disabled)
# %.o: %.rc
# 	$(WINDRES) -i $< -o $@

# Clean build artifacts
clean:
	del /Q $(OBJECTS) $(RES_OBJ) $(TARGET) 2>nul || true
	@echo "Cleaned build artifacts"

# Rebuild
rebuild: clean all

# Run the application
run: $(TARGET)
	./$(TARGET)

.PHONY: all clean rebuild run
