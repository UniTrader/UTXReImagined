#!/bin/bash

for f in ../t/*.xml
do
  xsltproc langfile_to_tts_voice.xsl $f | bash -
	
  lang="$(expr "$f" : '.*\-\(.*\)\..*')"
  xsltproc --stringparam Extensionpath ${PWD##*/} langfile_to_sound_library.xsl $f > ../libraries/sound_library-$lang.xml
  
done

# For Languages not Translated use English Files
xsltproc --stringparam Extensionpath ${PWD##*/} langfile_to_sound_library.xsl t/0001-L044.xml > ../libraries/sound_library.xml
  