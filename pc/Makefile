TARGETS		= scope

CXX		= g++

PCLIBS		= SDL2_gfx

CXXFLAGS	= -ggdb3 -std=c++11
LDFLAGS		= -ggdb3
LDLIBS		= -lusb -lm -lpthread

CXXFLAGS	+= $(shell pkg-config --cflags $(PCLIBS))
LDLIBS		+= $(shell pkg-config --libs $(PCLIBS))

.PHONY:		all clean

all:		$(TARGETS)

clean:
		rm -rf *.o $(TARGETS)

%.o:		%.cc
		$(CXX) -c $(CXXFLAGS) $^

scope:		scope.o ProggyOpti.o screen.o ui.o device.o
		$(CXX) -o $@ $^ $(LDFLAGS) $(LDLIBS)

test:		main.o
		$(CC) -o $@ $(LDFLAGS) $(filter %.o %.a,$^) $(LDLIBS)

