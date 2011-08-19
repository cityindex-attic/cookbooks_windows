SET activemq_version=ActiveMQStreaming
call svn export --force --username ciapiinaboxinstaller --password xITVsI https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/ActiveMQ-Endpoint/%activemq_version%.7z ActiveMQ-Endpoint/%activemq_version%.7z
7z x ActiveMQ-Endpoint\%activemq_version%.7z -oActiveMQ-Endpoint\%activemq_version%\