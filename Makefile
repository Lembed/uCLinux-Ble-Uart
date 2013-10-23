#
# Makefile for eMPL Linux userland implementation
#

CC = $(CROSS_COMPILE_APPS)gcc
CFLAGS := -Os -mcpu=cortex-m3 -mthumb -L ${INSTALL_ROOT}/A2F/root/usr/lib -pthread -DVERBOSITY=0
LDFLAGS	:= -mcpu=cortex-m3 -mthumb 

COMPARSER_DIR = COMparser
NETWORKSTAT_DIR = NetworkStat
PARSER_DIR = Parser
QUEUE_DIR = Queue
SERIALLOGIC_DIR = SerialLogic
GPIO_DIR = GPIO

IFLAGS := -I $(COMPARSER_DIR) -I $(NETWORKSTAT_DIR) -I $(PARSER_DIR) -I $(SERIALLOGIC_DIR) -I $(QUEUE_DIR) -I $(GPIO_DIR)

OBJS = dev_tools.o \
       serialLogic.o \
       Queue.o \
       NetworkStatistics.o \
       COMparser.o \
       Parser.o \
       gpio_api.o

all : main

main : $(OBJS) main.o
	$(CC) $(CFLAGS) $(OBJS) main.o -lm -o main

dev_tools.o : dev_tools.c
	$(CC) $(CFLAGS) $(IFLAGS) -c dev_tools.c
	
serialLogic.o : $(SERIALLOGIC_DIR)/serialLogic.c
	$(CC) $(CFLAGS) $(IFLAGS) -c $(SERIALLOGIC_DIR)/serialLogic.c

Queue.o : $(QUEUE_DIR)/Queue.c
	$(CC) $(CFLAGS) $(IFLAGS) -c $(QUEUE_DIR)/Queue.c

NetworkStatistics.o : $(NETWORKSTAT_DIR)/NetworkStatistics.c
	$(CC) $(CFLAGS) $(IFLAGS) -c $(NETWORKSTAT_DIR)/NetworkStatistics.c

COMparser.o : $(COMPARSER_DIR)/COMparser.c
	$(CC) $(CFLAGS) $(IFLAGS) -c $(COMPARSER_DIR)/COMparser.c

Parser.o : $(PARSER_DIR)/Parser.c
	$(CC) $(CFLAGS) $(IFLAGS) -c $(PARSER_DIR)/Parser.c

gpio_api.o : $(GPIO_DIR)/gpio_api.c
	$(CC) $(CFLAGS) $(IFLAGS) -c $(GPIO_DIR)/gpio_api.c

clean:
	rm -f *.o main main.gdb

