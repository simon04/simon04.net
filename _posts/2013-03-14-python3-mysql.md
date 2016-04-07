---
layout: post
title: MySQL connector for Python 3.3
published: true
---
Recently, I've been struggling to find a suitable MySQL connector for Python 3.3. Here's what I figured:

The following pip packages provide MySQL support for Python 3.3:

-   [CyMySQL](https://pypi.python.org/pypi/cymysql/0.5.5) (updated 2013-03-12, a fork of PyMySQL3)
-   [mysql-connector-python](https://pypi.python.org/pypi/mysql-connector-python/1.0.9) (updated 2013-02-21)
-   [PyMySQL3](https://pypi.python.org/pypi/PyMySQL3/0.5) (updated 2011-11-08)

You might also want to browse through [other packages on PyPI](https://pypi.python.org/pypi?:action=browse&show=all&c=256&c=533).

For CyMySQL/PyMySQL3, a tiny documentation is available via [GitHub](https://github.com/petehunt/PyMySQL/wiki/PyMySQL:-Pure-Python-MySQL-Client). The package mysql-connector-python is documented on [MySQL.com](https://dev.mysql.com/doc/connector-python/).

<hr>
Note that none of these packages seems to work with the [older MySQL authentication](https://dev.mysql.com/doc/internals/en/authentication-method.html):

For mysql-connector-python:

    Traceback (most recent call last):
      ...
      File "/usr/local/lib/python3.3/site-packages/mysql/connector/__init__.py", line 44, in Connect
        return MySQLConnection(*args, **kwargs)
      File "/usr/local/lib/python3.3/site-packages/mysql/connector/connection.py", line 108, in __init__
        self.connect(**kwargs)
      File "/usr/local/lib/python3.3/site-packages/mysql/connector/connection.py", line 350, in connect
        self._open_connection()
      File "/usr/local/lib/python3.3/site-packages/mysql/connector/connection.py", line 317, in _open_connection
        self._ssl)
      File "/usr/local/lib/python3.3/site-packages/mysql/connector/connection.py", line 163, in _do_auth
        "Authentication with old (insecure) passwords "
    mysql.connector.errors.NotSupportedError: Authentication with old (insecure) passwords is not supported. For more information, lookup Password Hashing in the latest MySQL manual

For CyMySQL/PyMySQL3:

    Traceback (most recent call last):
      ...
      File "/usr/local/lib/python3.3/site-packages/cymysql/__init__.py", line 100, in Connect
        return Connection(*args, **kwargs)
      File "/usr/local/lib/python3.3/site-packages/cymysql/connections.py", line 289, in __init__
        self._connect()
      File "/usr/local/lib/python3.3/site-packages/cymysql/connections.py", line 453, in _connect
        self._request_authentication()
      File "/usr/local/lib/python3.3/site-packages/cymysql/connections.py", line 495, in _request_authentication
        self._send_authentication()
      File "/usr/local/lib/python3.3/site-packages/cymysql/connections.py", line 552, in _send_authentication
        data = _scramble_323(self.password.encode(self.charset), self.salt.encode(self.charset)) + int2byte(0)
    AttributeError: 'bytes' object has no attribute 'encode'
