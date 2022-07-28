#!/bin/bash

mount -o rw,remount /

sudo rm /usr/lib/waydroid/data/Waydroid.desktop

mount -o ro,remount /
