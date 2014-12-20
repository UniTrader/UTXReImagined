#!/bin/bash

# generation of Voice Files commented out for Windows because i need to set up pico2wave and espeak first on Win
#for f in ../t/*.xml
#do
#  xsltproc.exe langfile_to_tts_voice.xsl $f | bash -
#	
#  lang="$(expr "$f" : '.*\-\(.*\)\..*')"
#  xsltproc.exe --stringparam Extensionpath ${PWD##*/} langfile_to_sound_library.xsl $f > #../libraries/sound_library-$lang.xml
#  
#done
#
# For Languages not Translated use English Files
#xsltproc.exe --stringparam Extensionpath ${PWD##*/} langfile_to_sound_library.xsl t/0001-L044.xml > ../libraries/sound_library.xml

# generate Shield, Turret, Bullet, Engine and Cargo Bay Files from balancing Templates using xslt conversions
# Shields, Turrets and Bullets are defined in one File for easy comparision & Balancing
# each Cargo Bay and Engines use a seperate Template

