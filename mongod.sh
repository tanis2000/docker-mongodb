#!/bin/sh
exec /usr/bin/mongod >>/var/log/mongod.log 2>&1
