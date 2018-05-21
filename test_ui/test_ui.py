from selenium import webdriver

import unittest
import time
import pytest

@pytest.mark.uitest
class TestFormater(unittest.TestCase):
    def test_plain_lowercase(self):
        options = webdriver.ChromeOptions()
        #All the arguments added for chromium to work on selenium
        options.add_argument("--no-sandbox") #This make Chromium reachable
        options.add_argument("--no-default-browser-check") #Overrides default choices
        options.add_argument("--no-first-run")
        options.add_argument("--disable-default-apps")
        driver = webdriver.Chrome('/home/travis/virtualenv/python2.7.14/bin/chromedriver',chrome_options=options')
        driver.get("http://127.0.0.1:5000/ui")
        link = driver.find_element_by_xpath("/html/body/div/div/a")
        link.click()
        time.sleep(2)


        driver.quit()
