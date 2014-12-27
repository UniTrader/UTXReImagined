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

# generate Shield, Turret, Bullet, Engine, Cargo Bay and Ship Type Files from balancing Templates using xslt conversions
# Shields, Turrets and Bullets are defined in one File for easy comparision & Balancing
# each Cargo Bay and Engines use a seperate Template, for Ship Types there are two (Capital Ships and small Ships)
#
# Generate Diff File which adds Tags for Single-Ware-Cargobays in libraries/wares.xml
xsltproc.exe add_tags_to_wares_as_diff.xsl  ../../../XR_extracted/libraries/wares.xml > ../libraries/wares.xml.new

# Generate Turret, Shield, Radar, Jumpdrive, Engine and Cargobay Macro Files from Balancing Templates
xsltproc.exe create_macros_from_template.xsl             ../templates/Turrets.xml       > ../assets/generated/xri_turret_macros.xml
xsltproc.exe create_macros_from_template.xsl             ../templates/Shields.xml       > ../assets/generated/xri_shieldgenerator_macros.xml
xsltproc.exe create_macros_from_template.xsl             ../templates/Radars.xml        > ../assets/generated/xri_radar_macros.xml
xsltproc.exe create_macros_from_template.xsl             ../templates/Jumpdrives.xml    > ../assets/generated/xri_jumpdrive_macros.xml
xsltproc.exe create_macros_from_template.xsl             ../templates/Engines.xml       > ../assets/generated/xri_engine_macros.xml
xsltproc.exe create_macros_from_template.xsl             ../templates/Cargobays.xml     > ../assets/generated/xri_cargobay_macros.xml

# Generate Turret Bullet File from Balancing Template
xsltproc.exe create_bullet_turret_file_from_template.xsl ../templates/Turrets.xml       > ../assets/generated/xri_bullet_turret_macros.xml

# Generate Ship Upgrade List from Balancing Templates listed in upgrade_list_ships.xml
xsltproc.exe create_multimacro_upgrade_list_from_template.xsl upgrade_list_ships.xml    > ../assets/generated/xri_upgrade_list_ships.xml

# Generate Storage Upgrade List from Cargobay Balancing Template   !!!!! NOT WORKING AS INTENDED YET - CARGO HIERARCHY MISSING !!!
xsltproc.exe create_multimacro_upgrade_list_from_template.xsl upgrade_list_storages.xml > ../assets/generated/xri_upgrade_list_storages.xml

# include templates/upgradelist_ships.xml in all L/XL Ship Macros instead of the current Upgrade List
for f in ../assets/units/size*/macros/*_macro.xml
do
    xsltproc.exe --stringparam upgradelist ../assets/generated/xri_upgrade_list_ships.xml update_macro_upgrade_list.xsl $F > $f.new
done

# Generate Skunk Pivot Fix from Game Data anew (in case EGO changes something there)
xsltproc.exe change_skunk_pivot_as_diff.xsl ../../../XR_extracted/assets/units/player/unit_player_ship.xml > ../assets/units/player/unit_player_ship.xml