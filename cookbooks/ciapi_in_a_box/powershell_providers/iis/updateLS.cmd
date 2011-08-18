SET lightstreamer_version=LightStreamerJavaAdapters
call svn export --force --username ciapiinaboxinstaller --password xITVsI https://cityindex.unfuddle.com/svn/cityindex_ciapi-in-a-box/LightStreamer/%lightstreamer_version%.7z LightStreamer/%lightstreamer_version%.7z
7z x Lightstreamer\%lightstreamer_version%.7z -oLightstreamer\%Lightstreamer_version%\