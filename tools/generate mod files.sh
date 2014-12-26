#!/bin/bash

# generate Voice Files
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
#
# add_tags_to_wares_as_diff.xsl -> apply to /libraries/wares.xml and output to same file in extension
# create_bullet_turret_file_from_template.xsl -> apply to templates/Turrets.xml and output to assets/generated/xri_bullet_turrets.xml
# create_turret_file_from_template.xsl -> apply to templates/Turrets.xml and output to assets/generated/xri_turrets.xml
# create_shield_file_from_template.xsl -> apply to templates/Shields.xml and output to assets/generated/xri_shields.xml
# create_cargobay_file_from_template.xsl -> apply to templates/Cargobays.xml and output to assets/generated/xri_cargobays.xml
# create_jumpdrive_file_from_template.xsl -> apply to templates/Jumpdrives.xml and output to assets/generated/xri_jumpdrives.xml
#
#
# create_multimacro_upgrade_list_from_template.xsl -> apply to files listed in ./upgrade_list_ships.xml and output to templates/upgradelist_ships.xml (overwrite if necesary)
#
# include templates/upgradelist_ships.xml in all L/XL Ship Macros instead of the current Upgrade List
#
# create_multimacro_upgrade_list_from_template.xsl -> apply to ./Cargobays.xml and output to templates/upgradelist_storages.xml (overwrite if necesary)
#
# include templates/upgradelist_storages.xml in all Storage Macros instead of the current Upgrade List
#
#

