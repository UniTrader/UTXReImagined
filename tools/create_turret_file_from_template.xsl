<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method='xml'/>
  <xsl:template match="/">
    <macros>
      <xsl:for-each select="turrets/turret/tech">
        <macro class="turret">
          <xsl:attribute name="name">
            <xsl:text>xri_turret_</xsl:text>
            <xsl:value-of select="../@size" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="../@type" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="../@user" />
            <xsl:text>_T</xsl:text>
            <xsl:value-of select="./@level" />
            <xsl:text>_macro</xsl:text>
          </xsl:attribute>
          <component>
            <xsl:attribute name="ref">
              <xsl:value-of select="./stats/surface_element/@component" />
            </xsl:attribute>
          </component>
          <properties>
            <identification unique="0" >
              <xsl:attribute name="name">
                <xsl:value-of select="./info/surface_element/@name" />
                <xsl:text> T</xsl:text>
                <xsl:value-of select="./@level" />
              </xsl:attribute>
              <xsl:attribute name="description">
                <xsl:value-of select="./info/surface_element/@description" />
              </xsl:attribute>
            </identification>
            <bullet>
              <xsl:attribute name="class">
                <xsl:text>xri_bullet_turret_</xsl:text>
                <xsl:value-of select="../@size" />
                <xsl:text>_</xsl:text>
                <xsl:value-of select="../@type" />
                <xsl:text>_</xsl:text>
                <xsl:value-of select="../@user" />
                <xsl:text>_T</xsl:text>
                <xsl:value-of select="./@level" />
                <xsl:text>_macro</xsl:text>
              </xsl:attribute>
            </bullet>
            <rotationspeed>
              <xsl:attribute name="max">
                <xsl:value-of select="./stats/surface_element/@rotationspeed" />
              </xsl:attribute>
            </rotationspeed>
            <reload />
            <hull threshold="0.25">
              <xsl:attribute name="max">
                <xsl:value-of select="./stats/surface_element/@hull" />
              </xsl:attribute>
            </hull>
            <effects>
              <explosion ref="explosion_turret_m_wall_pulse" />
              <sefx_damage_low ref="sefx_damage_m_low" />
              <sefx_damage_medium ref="sefx_damage_m_medium" />
              <sefx_damage_high ref="sefx_damage_m_high" />
              <sefx_shield ref="sefx_shield_m_01" />
            </effects>
            <xsl:if test="not(../@user = 'xenon' )" >
              <efficiency>
                <threshold threshold="0.75" value="1" />
                <threshold threshold="0.25" value="0.25" />
              </efficiency>
            </xsl:if>
          </properties>
        </macro>
      </xsl:for-each>
    </macros>
  </xsl:template>
</xsl:stylesheet>
