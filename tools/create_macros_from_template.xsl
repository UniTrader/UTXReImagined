<!-- this file is intended to replace the 6 other files (for cargobays, engines, jumpdrives, radars, shields ant turrets) which generate the macros currently -->
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
            <xsl:if test="./@type" >
              <xsl:text>_</xsl:text>
              <xsl:value-of select="./@type" />
            </xsl:if>
            <xsl:if test="./@user" >
              <xsl:text>_</xsl:text>
              <xsl:value-of select="./@user" />
            </xsl:if>
            <xsl:if test="./@variation" >
              <xsl:text>_</xsl:text>
              <xsl:value-of select="./@variation" />
            </xsl:if>
            <xsl:if test="../@level" >
              <xsl:text>_T</xsl:text>
              <xsl:value-of select="../@level" />
            </xsl:if>
            <xsl:text>_macro</xsl:text>
          </xsl:attribute>
          <component>
            <xsl:attribute name="ref">
              <xsl:choose>
                <xsl:when test="name(.) = 'cargobay'">
                  <xsl:text>generic_cargobay</xsl:text>
                </xsl:when>
                <xsl:otherwise>
                  <xsl:value-of select="./stats/surface_element/@component" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </component>
          <properties>
            <xsl:if test="./info/surface_element" >
            <identification unique="0" >
              <xsl:attribute name="name">
                <xsl:value-of select="./info/surface_element/@name" />
                <xsl:if test="../@level" >
                  <xsl:text> T</xsl:text>
                  <xsl:value-of select="../@level" />
                </xsl:if>
              </xsl:attribute>
              <xsl:attribute name="description">
                <xsl:value-of select="./info/surface_element/@description" />
              </xsl:attribute>
            </identification>
            </xsl:if>
            <xsl:if test="name(.) = 'turret'" >
              <bullet>
                <xsl:attribute name="class">
                  <xsl:text>xri_bullet_</xsl:text>
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
              </bullet>
              <rotationspeed>
                <xsl:attribute name="max">
                  <xsl:value-of select="./stats/surface_element/@rotationspeed" />
                </xsl:attribute>
              </rotationspeed>
              <reload />
            </xsl:if>
            <xsl:copy-of select="./stats/acceleration" />
            <xsl:copy-of select="./stats/angular" />
            <xsl:copy-of select="./stats/speed" />
            <xsl:if test="./stats/booster and not(./stats/booster/@ref)">
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
            <xsl:copy-of select="./stats/cargo" />
            <xsl:copy-of select="./stats/radar" />
            <xsl:if test="./stats/shield/@engineboost" >
              <boost>
                <xsl:attribute name="duration">
                  <xsl:value-of select="./stats/shield/@engineboost"/>
                </xsl:attribute>
              </boost>
            </xsl:if>
            <xsl:if test="./stats/shield">
              <recharge max="600000" rate="2500" delay="8">
                <xsl:attribute name="max">
                  <xsl:value-of select="./stats/shield/@max"/>
                </xsl:attribute>
                <xsl:attribute name="rate">
                  <xsl:value-of select="./stats/shield/@rate"/>
                </xsl:attribute>
                <xsl:attribute name="delay">
                  <xsl:value-of select="./stats/shield/@delay"/>
                </xsl:attribute>
              </recharge>
            </xsl:if>
            <xsl:if test="./stats/surface_element/@hull" >
              <hull threshold="0.25">
                <xsl:attribute name="max">
                  <xsl:value-of select="./stats/surface_element/@hull" />
                </xsl:attribute>
              </hull>
            </xsl:if>
            <xsl:copy-of select="./stats/jumpdrive" />
            <xsl:if test="./effects">
              <effects>
                <xsl:if test="./effects/jumpdrive/@activation" >
                  <activation>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./effects/jumpdrive/@activation" />
                    </xsl:attribute>
                  </activation>
                </xsl:if>
                <xsl:if test="./effects/jumpdrive/@deactivation" >
                  <deactivation>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./effects/jumpdrive/@deactivation" />
                    </xsl:attribute>
                  </deactivation>
                </xsl:if>
                <xsl:if test="./effects/others/@explosion" >
                  <explosion>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./effects/others/@explosion" />
                    </xsl:attribute>
                  </explosion>
                </xsl:if>
                <xsl:if test="./effects/jump/@in" >
                  <jumpin>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./effects/jump/@in" />
                    </xsl:attribute>
                  </jumpin>
                </xsl:if>
                <xsl:if test="./effects/jump/@out" >
                  <jumpout>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./effects/jump/@out" />
                    </xsl:attribute>
                  </jumpout>
                </xsl:if>
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
                <xsl:if test="./effects/others/@shield" >
                  <sefx_shield>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./effects/others/@shield" />
                    </xsl:attribute>
                  </sefx_shield>
                </xsl:if>
                <xsl:if test="./stats/booster and not(./stats/booster/@ref)">
                  <boosting>
                    <xsl:attribute name="ref">
                      <xsl:value-of select="./stats/booster/@effect" />
                    </xsl:attribute>
                  </boosting>
                </xsl:if>
              </effects>
            </xsl:if>
            <!-- ToDo: this part needs to depend on the Definitions of each macro instead of being hard-coded here -->
            <xsl:if test="
            not(./@user = 'xenon' ) and ( name (.) = 'turret' )
            or name(.) = 'jumpdrive'
            or name(.) = 'radar'
            or name(.) = 'shieldgenerator'" >
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
