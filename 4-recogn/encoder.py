#!/usr/bin/env python
# coding: utf-8
# pyqrcode sample encoder
import sys, qrcode

e = qrcode.Encoder()
image = e.encode('woah!', version=15, mode=e.mode.BINARY, eclevel=e.eclevel.H)
image.save('out.png')
