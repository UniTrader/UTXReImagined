<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml"/>
  <xsl:template match="/">
    <diff>
      <xsl:for-each select="//connection | //spot" >
        <xsl:choose>
          <xsl:when test="./offset/position" >
            <replace>
              <xsl:attribute name="sel" >
                <xsl:text>//</xsl:text>
                <xsl:value-of select="name(.)" />
                <xsl:text>[@name='</xsl:text>
                <xsl:value-of select="./@name" />
                <xsl:text>']/offset/position</xsl:text>
              </xsl:attribute>
              <position>
                <xsl:attribute name="x">
                  <xsl:value-of select="./offset/position/@x + 2.136541" />
                </xsl:attribute>
                <xsl:attribute name="y">
                  <xsl:value-of select="./offset/position/@y - 5.27167" />
                </xsl:attribute>
                <xsl:attribute name="z">
                  <xsl:value-of select="./offset/position/@z + 19.70758" />
                </xsl:attribute>
              </position>
            </replace>
          </xsl:when>
          <xsl:when test="./offset and @name != 'space' " >
            <add>
              <xsl:attribute name="sel" >
                <xsl:text>//</xsl:text>
                <xsl:value-of select="name(.)" />
                <xsl:text>[@name='</xsl:text>
                <xsl:value-of select="./@name" />
                <xsl:text>']/offset</xsl:text>
              </xsl:attribute>
              <position x="2.136541" y="-5.27167" z="19.70758" />
            </add>
          </xsl:when>
        </xsl:choose>
      </xsl:for-each>
    </diff>
  </xsl:template>
</xsl:stylesheet>
