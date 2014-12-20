<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method='xml' indent='yes'/>
  <!--xsl:variable name='Extensionpath'>UTXReImagined</xsl:variable-->
  <xsl:param name="Extensionpath" />
  <xsl:template match="/">
  
    <soundlibrary xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="sound_library.xsd">
    
      <xsl:for-each select="language/page">
      
        <sound>
          <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
            <xsl:text>_normal</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="description">
            <xsl:value-of select="@description"/>
          </xsl:attribute>
          <xsl:attribute name="repeat">
            <xsl:text>1</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="is3d">
            <xsl:text>1</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="preload">
            <xsl:text>0</xsl:text>
          </xsl:attribute>
          <sample>
            <xsl:attribute name="start">
              <xsl:text>Extensions\</xsl:text>
              <xsl:value-of select="$Extensionpath"/>
              <xsl:text>\voice-L</xsl:text>
              <xsl:value-of select='format-number(/language/@id, "000")' />
              <xsl:text>\</xsl:text>
              <xsl:value-of select="@id"/>
              <xsl:text>\normal</xsl:text>
            </xsl:attribute>
          </sample>
          <effects>
            <filter mode="bandpass" frequency="0.26" oneoverq="1.45" />
            <reverb room="sewer pipe" roomsize="10" drymix="5" density="90" />
          </effects>
        </sound>
        <sound>
          <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
            <xsl:text>_normal_muffled</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="description">
            <xsl:value-of select="@description"/>
          </xsl:attribute>
          <xsl:attribute name="repeat">
            <xsl:text>1</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="is3d">
            <xsl:text>1</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="preload">
            <xsl:text>0</xsl:text>
          </xsl:attribute>
          <sample>
            <xsl:attribute name="start">
              <xsl:text>Extensions\</xsl:text>
              <xsl:value-of select="$Extensionpath"/>
              <xsl:text>\voice-L</xsl:text>
              <xsl:value-of select='format-number(/language/@id, "000")' />
              <xsl:text>\</xsl:text>
              <xsl:value-of select="@id"/>
              <xsl:text>\normal</xsl:text>
            </xsl:attribute>
          </sample>
          <effects>
            <filter mode="bandpass" frequency="0.1" oneoverq="1.45" />
            <reverb room="sewer pipe" roomsize="10" drymix="80" density="90" />
          </effects>
        </sound>
        <sound>
          <xsl:attribute name="id">
            <xsl:value-of select="@id"/>
            <xsl:text>_comm</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="description">
            <xsl:value-of select="@description"/>
          </xsl:attribute>
          <xsl:attribute name="repeat">
            <xsl:text>1</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="is3d">
            <xsl:text>1</xsl:text>
          </xsl:attribute>
          <xsl:attribute name="preload">
            <xsl:text>0</xsl:text>
          </xsl:attribute>
          <sample>
            <xsl:attribute name="start">
              <xsl:text>Extensions\</xsl:text>
              <xsl:value-of select="$Extensionpath"/>
              <xsl:text>\voice-L</xsl:text>
              <xsl:value-of select='format-number(/language/@id, "000")' />
              <xsl:text>\</xsl:text>
              <xsl:value-of select="@id"/>
              <xsl:text>\normal</xsl:text>
            </xsl:attribute>
          </sample>
          <effects>
            <filter mode="bandpass" frequency="0.1" oneoverq="1.45" />
            <reverb room="sewer pipe" roomsize="10" drymix="80" density="90" />
          </effects>
        </sound>
      <!--
        <sound id="5554203_normal" description="Board computer - Betty" repeat="1" is3d="1" preload="0">
          <sample start="Extensions\UTXReImagined\voice-L044\5554203\normal" />
          <effects>
            <filter mode="bandpass" frequency="0.26" oneoverq="1.45" />
            <reverb room="sewer pipe" roomsize="10" drymix="5" density="90" />
          </effects>
        </sound>
        <sound id="5554203_normal_muffled" description="Board computer - Betty" repeat="1" is3d="1" preload="0">
          <sample start="Extensions\UTXReImagined\voice-L044\5554203\normal" />
          <effects>
            <filter mode="bandpass" frequency="0.1" oneoverq="1.45" />
            <reverb room="sewer pipe" roomsize="10" drymix="80" density="90" />
          </effects>
        </sound>
        <sound id="5554203_comm" description="Board computer - Betty" repeat="1" is3d="1" preload="0">
          <sample start="Extensions\UTXReImagined\voice-L044\5554203\normal" />
          <effects>
            <filter mode="bandpass" frequency="0.26" oneoverq="1.45" />
            <reverb room="sewer pipe" roomsize="10" drymix="5" density="90" />
          </effects>
        </sound>
        -->
      </xsl:for-each>
      
    </soundlibrary>
    
  </xsl:template>
</xsl:stylesheet>
