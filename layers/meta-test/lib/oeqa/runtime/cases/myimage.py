# Copyright (C) 2016 Intel Corporation
#
# SPDX-License-Identifier: MIT
#

from oeqa.runtime.case import OERuntimeTestCase

class MyimageTest(OERuntimeTestCase):
    def test_myimage(self):
        self.logger.info('IMAGE: %s' % self.td.get('IMAGE'))
        self.logger.info('ARCH: %s' % self.td.get('ARCH'))


