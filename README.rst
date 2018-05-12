Simple Flask App
================

Aplikacja Dydaktyczna wyświetlająca imię i wiadomość w różnych formatach dla zajęć
o Continuous Integration, Continuous Delivery i Continuous Deployment.

- Rozpocząnając pracę z projektem (wykorzystując virtualenv). Hermetyczne środowisko dla pojedyńczej aplikacji w python-ie:

  ::

    source /usr/bin/virtualenvwrapper.sh
    mkvirtualenv wsb-simple-flask-app
    pip install -r requirements.txt
    pip install -r test_requirements.txt

- Uruchamianie applikacji:

  ::

    # jako zwykły program
    python main.py

    # albo:
    PYTHONPATH=. FLASK_APP=hello_world flask run

- Uruchamianie testów (see: http://doc.pytest.org/en/latest/capture.html):

  ::

    PYTHONPATH=. py.test
    PYTHONPATH=. py.test  --verbose -s

- Kontynuując pracę z projektem, aktywowanie hermetycznego środowiska dla aplikacji py:

  ::

    source /usr/bin/virtualenvwrapper.sh
    workon wsb-simple-flask-app


- Integracja z TravisCI:

  ::
    Dodanie do repozytorium pliku konfiguracyjnego .travis.yml dla projektu python (see:https://docs.travis-ci.com/user/languages/python/)

- Instalacja pakietu do repozytorium (see:https://hub.docker.com)

- Deployment do heroku z maszyny dev, z wykorzystaniem gunicorn (see:https://devcenter.heroku.com/articles/python-gunicorn)

- Deployment do heroku z TravisCI (see:https://docs.travis-ci.com/user/deployment/heroku/)

- Monitoring  z Statuscake (see:https://www.statuscake.com/)

- Badge z TravisCI:
    https://travis-ci.org/AddaKowalczyk8/se_hello_printer_app.svg?branch=master

- Badge z Statuscake:
    https://app.statuscake.com/button/index.php?Track=oIcafpmold&Days=1&Design=1 - jeden dzień
    https://app.statuscake.com/button/index.php?Track=oIcafpmold&Days=30&Design=1 - 30 dni

    ...


Pomocnicze
==========

- Instalacja python virtualenv i virtualenvwrapper:

  ::

    yum install python-pip
    pip install -U pip
    pip install virtualenv
    pip install virtualenvwrapper

- Instalacja docker-a:

  ::

    yum remove docker \
        docker-common \
        container-selinux \
        docker-selinux \
        docker-engine

    yum install -y yum-utils

    yum-config-manager \
      --add-repo \
      https://download.docker.com/linux/centos/docker-ce.repo

    yum makecache fast
    yum install docker-ce
    systemctl start docker

Materiały
=========

- https://virtualenvwrapper.readthedocs.io/en/latest/
