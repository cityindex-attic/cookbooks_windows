SET activemq_version=ActiveMQ
call svn export --force --username ciapiinaboxinstaller --password xITVsI https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/ActiveMQ-MessageBus/%activemq_version%.7z ActiveMQMessageBus/%activemq_version%.7z
7z x ActiveMQMessageBus\%activemq_version%.7z -oActiveMQMessageBus\%activemq_ver
sion%\