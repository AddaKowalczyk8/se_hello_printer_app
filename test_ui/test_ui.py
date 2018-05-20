from selenium import webdriver

import unittest
import time
import pytest

SELENIUM_WEBDRIVERS = {
    'default': {
        'callable': webdriver.Chrome,
        'args': (),
        'kwargs': {},
    },
    'firefox': {
        'callable': webdriver.Firefox,
        'args': (),
        'kwargs': {},
    },
}

@pytest.mark.uitest
class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        driver = webdriver.Chrome()
        driver.get("http://127.0.0.1:5000/ui")
        link = driver.find_element_by_xpath("/html/body/div/div/a")
        link.click()
        time.sleep(2)


        driver.quit()
