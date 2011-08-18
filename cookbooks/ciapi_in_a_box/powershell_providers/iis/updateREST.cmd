SET RESTWebServices_version=RESTWebservices
call svn export --force --username ciapiinaboxinstaller --password xITVsI https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/RestWebServices/%RESTWebServices_version%.7z RESTWebServices/%RESTWebServices_version%.7z
7z x RESTWebservices\%RESTWebServices_version%.7z -oRESTWebServices\%RESTWebServices_version%\
rmdir RESTWebservices\current
del /Q RESTWebservices\current_is*.*
mklink /D RESTWebservices\current %RESTWebServices_version%\RESTWebservices
echo %RESTWebServices_version% > RESTWebServices\current_is_%RESTWebServices_version%.txt
