<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <diff>
      <xsl:for-each select="/wares/ware" >
        <replace>
          <xsl:attribute name="sel" >
            <xsl:text>/ware[@id='</xsl:text>
            <xsl:value-of select="./@id" />
            <xsl:text>']/@tags</xsl:text>
          </xsl:attribute>
          <xsl:value-of select="./@tags" />
          <xsl:text> ware_</xsl:text>
          <xsl:value-of select="./@id" />
        </replace>
      </xsl:for-each>
    </diff>
  </xsl:template>
</xsl:stylesheet>

