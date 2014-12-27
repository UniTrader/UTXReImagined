<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match="*">
    <xsl:copy>
      <xsl:apply-templates select="@*|*|text()"/>
    </xsl:copy>
  </xsl:template>
  <xsl:template match="upgrades">
    <xsl:copy-of select="document($upgradelist)/upgrades" />
  </xsl:template>

  <xsl:template match="@*|text()">
    <xsl:copy/>
  </xsl:template>

</xsl:stylesheet>
