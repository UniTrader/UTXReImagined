#!/bin/bash

for f in ../t/*.xml
do
  xsltproc langfile_to_tts_voice.xsl $f | bash -
	
  lang="$(expr "$f" : '.*\-\(.*\)\..*')"
  xsltproc --stringparam Extensionpath ${PWD##*/} langfile_to_sound_library.xsl $f > ../libraries/sound_library-$lang.xml
  
done

# For Languages not Translated use English Files
xsltproc --stringparam Extensionpath ${PWD##*/} langfile_to_sound_library.xsl t/0001-L044.xml > ../libraries/sound_library.xml

# generate Shield, Turret, Bullet, Engine, Cargo Bay and Ship Type Files from balancing Templates using xslt conversions
# Shields, Turrets and Bullets are defined in one File for easy comparision & Balancing
# each Cargo Bay and Engines use a seperate Template, for Ship Types there are two (Capital Ships and smapp Ships)

