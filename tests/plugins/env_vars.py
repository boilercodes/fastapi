import os

import pytest


@pytest.hookimpl(tryfirst=True)
def pytest_load_initial_conftests() -> None:
    """Initiate required environment variables."""
    os.environ["TEST_ENV_VAR"] = "test"
