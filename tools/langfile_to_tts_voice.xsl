<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method='text'/>
  <xsl:variable name='newline'>
    <!-- line indent deliberate !!! -->
    <xsl:text>
</xsl:text>
  </xsl:variable>
  <xsl:template match="/">
    <xsl:for-each select="language/page/t">
      <xsl:if test="not(contains(.,'{')) and not(@voice='no')">
        <!-- select tts engine based on Attributes; currently supported: pico2wave (default/last tried) and espeak -->
        <xsl:choose>
          <xsl:when test="../@espeak-options" >
            <xsl:text>espeak </xsl:text>
            <xsl:choose>
              <!-- specific tts engine options for this Entry found - use it -->
              <xsl:when test="@espeak-options" >
                <xsl:value-of select="@espeak-options" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="../@espeak-options" />
              </xsl:otherwise>
            </xsl:choose>
            <xsl:value-of select="@espeak-options" />
            <xsl:text> --stdout </xsl:text>
            
            <!-- get & format Text to Speak -->
            <xsl:choose>
              <!-- extra Text for direct input in TTS-Engine found - use it -->
              <xsl:when test="@speak">
                <xsl:text>&quot;</xsl:text>
                <xsl:value-of select="@speak"/>
                <xsl:text>&quot;</xsl:text>
              </xsl:when>
              
              <!-- no prepared text found - in this case some more actions may be necesary to avoid complications -->
              <xsl:otherwise>
                <xsl:text>&quot;</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>&quot;</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
            
            <!-- Pipe it to ogg encoder and write to according file -->
            <xsl:text> | oggenc - --resample 44100 -o </xsl:text>
            <xsl:text>../voice-L</xsl:text>
            <xsl:value-of select='format-number(/language/@id, "000")' />
            <xsl:text>/</xsl:text>
            <xsl:value-of select="../@id"/>
            <xsl:text>/normal/</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>.ogg</xsl:text>
            <xsl:value-of select="$newline"/>
            <xsl:text>rm /tmp/pico2wave.wav</xsl:text><!-- delete temp file -->
            <xsl:value-of select="$newline"/>
            
          </xsl:when>
          <!-- last/default tts Engine: pico2wave (has imo the most natural sound, although it is limited in voices and options -->
          <xsl:otherwise>
            <xsl:text>pico2wave </xsl:text>
            <xsl:choose>
              <xsl:when test="@pico2wave-options" >
                <xsl:value-of select="@pico2wave-options" />
              </xsl:when>
              <xsl:when test="../@pico2wave-options">
                <xsl:value-of select="../@pico2wave-options" />
              </xsl:when>
            </xsl:choose>
            <!-- (no piping in pico2wave, workaround: use a temp file) -->
            <xsl:text> -w /tmp/pico2wave.wav </xsl:text>

            <!-- get & format Text to Speak -->
            <xsl:choose>

              <!-- extra Text for direct input in TTS-Engine found - use it -->
              <xsl:when test="@speak">
                <xsl:text>&quot;</xsl:text>
                <xsl:value-of select="@speak"/>
                <xsl:text>&quot;</xsl:text>
              </xsl:when>
              
              <!-- no prepared text found - in this case some more actions may be necesary to avoid complications -->
              <xsl:otherwise>
                <xsl:text>&quot;</xsl:text>
                <xsl:value-of select="."/>
                <xsl:text>&quot;</xsl:text>
              </xsl:otherwise>
              
              
            </xsl:choose>
            
            <!-- Pipe it to ogg encoder (no piping in pico2wave, workaround: use a temp file) -->
            <xsl:value-of select="$newline"/>
            <xsl:text>oggenc /tmp/pico2wave.wav --resample 44100 -o </xsl:text>
            <xsl:text>voice-L</xsl:text>
            <xsl:value-of select='format-number(/language/@id, "000")' />
            <xsl:text>/</xsl:text>
            <xsl:value-of select="../@id"/>
            <xsl:text>/normal/</xsl:text>
            <xsl:value-of select="@id"/>
            <xsl:text>.ogg</xsl:text>
            <xsl:value-of select="$newline"/>
            <xsl:text>rm /tmp/pico2wave.wav</xsl:text><!-- delete temp file -->
            <xsl:value-of select="$newline"/>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
</xsl:stylesheet>
