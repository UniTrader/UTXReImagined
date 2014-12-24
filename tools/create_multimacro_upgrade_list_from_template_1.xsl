<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <!-- this file is not yet ready - needs multiple Files to work with, which are not created yet -->
  <xsl:output method='xml'/>
  <xsl:template match="/">
    <upgrades multimacro="1" >
      <xsl:for-each select="//tech">
        <upgrade>
          <!-- construct macro name for all Upgrades based on the given Name Components -->
          <xsl:attribute name="upgrade">
            <xsl:text>xri_</xsl:text>
            <xsl:value-of select="name(..)" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="../@size" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="../@type" />
            <xsl:if test="../@user" >
              <xsl:text>_</xsl:text>
              <xsl:value-of select="../@user" />
            </xsl:if>
            <xsl:if test="../@variation" >
              <xsl:text>_</xsl:text>
              <xsl:value-of select="../@variation" />
            </xsl:if>
            <xsl:text>_T</xsl:text>
            <xsl:value-of select="./@level" />
            <xsl:text>_macro</xsl:text>
          </xsl:attribute>
          <!-- add Tags where this Surface Element can be installad -->
          <xsl:attribute name="tags">
            <xsl:text>xri_se_</xsl:text>
            <xsl:value-of select="../@size" />
            <!-- shields have additional slots exclusive for them -->
            <xsl:if test="name(..) = 'shield'">
              <xsl:text> </xsl:text>
              <xsl:text>xri_se_</xsl:text>
              <xsl:value-of select="../@size" />
              <xsl:text>_shield</xsl:text>
            </xsl:if>
          </xsl:attribute>
        </upgrade>
      </xsl:for-each>
    </upgrades>
  </xsl:template>
</xsl:stylesheet>
