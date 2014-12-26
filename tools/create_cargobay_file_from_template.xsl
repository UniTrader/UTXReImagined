<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method='xml'/>
  <xsl:template match="/">
    <macros>
      <xsl:for-each select="/*/tech/*">
        <macro class="cargobay">
          <xsl:attribute name="name">
            <xsl:text>xri_</xsl:text>
            <xsl:value-of select="name(.)" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="./@size" />
            <xsl:text>_</xsl:text>
            <xsl:value-of select="./@type" />
            <xsl:text>_macro</xsl:text>
          </xsl:attribute>
          <component ref="generic_cargobay" />
          <properties>
            <cargo max="10000" tags="fuel">
              <xsl:attribute name="max">
                <xsl:value-of select="./cargo/@max" />
              </xsl:attribute>
              <xsl:attribute name="tags">
                <xsl:value-of select="./cargo/@tags" />
              </xsl:attribute>
            </cargo>
          </properties>
        </macro>
      </xsl:for-each>
    </macros>
  </xsl:template>
</xsl:stylesheet>
