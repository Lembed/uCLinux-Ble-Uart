/*
 * Parser.h
 *
 *  Created on: Sep 5, 2013
 *      Author: rasmus
 */

#ifndef PARSER_H_
#define PARSER_H_

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "HCI_defs.h"

enum parserState_t {
	package_type_token,
	command_code_token,
	event_code_token,
	length_token,
	data_token
};

int parse_data(datagram_t *datagram, char *data, int length, int *offset, int _parserState);
int compose_datagram(datagram_t *datagram, char data[], int *length);
void pretty_print_datagram(datagram_t *datagram);

int get_GAP_DeviceInit(datagram_t *datagram);
int get_GAP_EstablishLinkRequest(datagram_t *datagram, char *MAC);
int get_GAP_TerminateLinkRequest(datagram_t *datagram, long connHandle);
int get_GATT_WriteCharValue(datagram_t *datagram, long connHandle, long handle, char *data, int length);

#endif /* PARSER_H_ */
