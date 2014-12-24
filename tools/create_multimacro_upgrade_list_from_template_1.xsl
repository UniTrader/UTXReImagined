<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method='xml'/>
	<xsl:template match="/">
		<upgrades multimacro="1" >
			<xsl:for-each select="weaponsystems/tech/*">
				<upgrade>
					<xsl:attribute name="upgrade">
						<xsl:text>xri_</xsl:text>
						<xsl:value-of select="name(.)" />
						<xsl:text>_</xsl:text>
						<xsl:value-of select="./@size" />
						<xsl:text>_</xsl:text>
						<xsl:value-of select="./@type" />
						<xsl:if test="./@user" >
							<xsl:text>_</xsl:text>
							<xsl:value-of select="./@user" />
						</xsl:if>
						<xsl:if test="./@variation" >
							<xsl:text>_</xsl:text>
							<xsl:value-of select="./@variation" />
						</xsl:if>
						<xsl:text>_T</xsl:text>
						<xsl:value-of select="../@level" />
						<xsl:text>_macro</xsl:text>
					</xsl:attribute>
					<xsl:attribute name="tags">
						<xsl:text>xri_se_</xsl:text>
						<xsl:value-of select="./@size" />
						<xsl:if test="name(.) = 'shield'">
							<xsl:text> </xsl:text>
							<xsl:text>xri_se_</xsl:text>
							<xsl:value-of select="./@size" />
							<xsl:text>_shield</xsl:text>
						</xsl:if>
					</xsl:attribute>
				</upgrade>
			</xsl:for-each>
		</upgrades>
	</xsl:template>
</xsl:stylesheet>
