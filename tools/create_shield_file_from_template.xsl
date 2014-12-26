<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method='xml'/>
  <xsl:template match="/">
    <macros>
      <xsl:for-each select="/*/tech/*">
        <macro>
          <xsl:attribute name="class">
            <xsl:value-of select="name(.)" />
          </xsl:attribute>
          <xsl:attribute name="name">
            <xsl:text>xri_</xsl:text>
            <xsl:value-of select="name(.)" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="./@size" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="./@type" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="./@user" />
            <xsl:text>_T</xsl:text>
            <xsl:value-of select="../@level" />
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
                <xsl:value-of select="./info/@name" />
                <xsl:text> T</xsl:text>
                <xsl:value-of select="./@level" />
              </xsl:attribute>
              <xsl:attribute name="description">
                <xsl:value-of select="./info/@description" />
              </xsl:attribute>
            </identification>
            <xsl:if test="./stats/shield/@engineboost" >
              <boost>
                <xsl:attribute name="duration">
                  <xsl:value-of select="./stats/shield/engineboost"/>
                </xsl:attribute>
              </boost>
            </xsl:if>
            <hull threshold="0.25">
              <xsl:attribute name="max">
                <xsl:value-of select="./stats/surface_element/@hull" />
              </xsl:attribute>
            </hull>
            <effects>
              <sefx_damage_low>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./effects/damage/@low" />
                </xsl:attribute>
              </sefx_damage_low>
              <sefx_damage_medium>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./effects/damage/@medium" />
                </xsl:attribute>
              </sefx_damage_medium>
              <sefx_damage_high>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./effects/damage/@high" />
                </xsl:attribute>
              </sefx_damage_high>
              <sefx_shield>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./effects/others/@shield" />
                </xsl:attribute>
              </sefx_shield>
            </effects>
            <efficiency>
              <threshold threshold="0.75" value="1" />
              <threshold threshold="0.25" value="0.25" />
            </efficiency>
          </properties>
        </macro>
      </xsl:for-each>
    </macros>
  </xsl:template>
</xsl:stylesheet>
