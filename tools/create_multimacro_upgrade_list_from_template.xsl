<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- this file is not yet ready - needs multiple Files to work with, which are not created yet -->
  <xsl:output method='xml'/>
  <xsl:template match="/">
    <upgrades multimacro="1" >
        <xsl:for-each select="document( /list/entry/@name)/*/tech/*">
          <upgrade>
            <!-- construct macro name for all Upgrades based on the given Name Components -->
            <xsl:attribute name="upgrade">
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
            <!-- add Tags where this Surface Element can be installad -->
            <xsl:attribute name="tags">
              <xsl:choose>
                <!-- Tags for Logos -->
                <xsl:when test="name(.) = 'logo'" >
                  <xsl:text>xri_se_</xsl:text>
                  <xsl:value-of select="name(.)" />
                  <xsl:text>_</xsl:text>
                  <xsl:value-of select="./@size" />
                </xsl:when>
                <!-- Tags for Jumpdrive, Engines, Radar -->
                <xsl:when test="name(.) = 'jumpdrive' or name(.) = 'engine' or name(.) = 'radar' " >
                  <xsl:text>xri_se_</xsl:text>
                  <xsl:value-of select="name(.)" />
                  <xsl:text>_</xsl:text>
                  <xsl:value-of select="./@size" />
                </xsl:when>
                <!-- Tags for Cargobays - !!!ADD HIERARCHY HERE!!! -->
                <xsl:when test="name(.) = 'cargobay'" >
                  <xsl:text>xri_</xsl:text>
                  <xsl:value-of select="name(.)" />
                  <xsl:text>_</xsl:text>
                  <xsl:value-of select="./@size" />
                </xsl:when>
                <!-- Tags for other Elements which use exchangeable connections -->
                <xsl:otherwise>
                  <!-- size only -->
                  <xsl:text>xri_se_</xsl:text>
                  <xsl:value-of select="./@size" />
                  <!-- slots exclusive for certain types of SE -->
                  <xsl:text> </xsl:text>
                  <xsl:text>xri_se_</xsl:text>
                  <xsl:value-of select="./@size" />
                  <xsl:text>_</xsl:text>
                  <xsl:value-of select="name(.)" />
                </xsl:otherwise>
              </xsl:choose>
            </xsl:attribute>
          </upgrade>
        </xsl:for-each>
    </upgrades>
  </xsl:template>
</xsl:stylesheet>
