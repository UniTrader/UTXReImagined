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
            <xsl:value-of select="./@variation" />
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
            <xsl:copy-of select="./stats/acceleration" />
            <xsl:copy-of select="./stats/angular" />
            <xsl:copy-of select="./stats/speed" />
            <xsl:if test="./stats/booster and not ./stats/booster/@ref">
              <boost>
                <xsl:attribute name="charge">
                  <xsl:value-of select="./stats/booster/@charge" />
                </xsl:attribute>
                <xsl:attribute name="duration">
                  <xsl:value-of select="./stats/booster/@duration" />
                </xsl:attribute>
                <xsl:attribute name="minshieldpercent">
                  <xsl:value-of select="./stats/booster/@minshieldpercent" />
                </xsl:attribute>
                <xsl:attribute name="recharge">
                  <xsl:value-of select="./stats/booster/@recharge" />
                </xsl:attribute>
                <xsl:copy-of select="./stats/booster/speed" />
                <xsl:copy-of select="./stats/booster/acceleration" />
              </boost>
            </xsl:if>
            <hull threshold="0.25">
              <xsl:attribute name="max">
                <xsl:value-of select="./stats/surface_element/@hull" />
              </xsl:attribute>
            </hull>
            <effects>
              <explosion>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./effects/others/@explosion" />
                </xsl:attribute>
              </explosion>
              <xsl:if test="./effects/damage/@low" >
                <sefx_damage_low>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./effects/damage/@low" />
                  </xsl:attribute>
                </sefx_damage_low>
              </xsl:if>
              <xsl:if test="./effects/damage/@medium" >
                <sefx_damage_medium>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./effects/damage/@medium" />
                  </xsl:attribute>
                </sefx_damage_medium>
              </xsl:if>
              <xsl:if test="./effects/damage/@high" >
                <sefx_damage_high>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./effects/damage/@high" />
                  </xsl:attribute>
                </sefx_damage_high>
              </xsl:if>
              <sefx_shield>
                <xsl:attribute name="ref">
                  <xsl:value-of select="./effects/others/@shield" />
                </xsl:attribute>
              </sefx_shield>
              <xsl:if test="./stats/booster and not ./stats/booster/@ref">
                <boosting>
                  <xsl:attribute name="ref">
                    <xsl:value-of select="./stats/booster/@effect" />
                  </xsl:attribute>
                </boosting>
              </xsl:if>
            </effects>
          </properties>
        </macro>
      </xsl:for-each>
    </macros>
  </xsl:template>
</xsl:stylesheet>
