# ProjectName SDK exists test

import pytest
from pokapi_sdk import PokapiSDK


class TestExists:

    def test_should_create_test_sdk(self):
        testsdk = PokapiSDK.test(None, None)
        assert testsdk is not None
