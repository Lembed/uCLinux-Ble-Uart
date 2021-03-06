/*
 * COMparser.h
 *
 *  Created on: Sep 20, 2013
 *      Author: rasmus
 */

#ifndef COMPARSER_H_
#define COMPARSER_H_

#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>

#include "../ble_device.h"
#include "../dev_tools.h"
#include "../Parser/HCI_defs.h"
#include "../Queue/Queue.h"
#include "../GPIO/gpio_api.h"

void *RxComParser(void *_bleCentral);

#endif /* COMPARSER_H_ */
