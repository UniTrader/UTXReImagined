<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method='xml'/>
	<xsl:template match="/">
		<macros>
			<xsl:for-each select="weaponsystems/tech/turret">
				<macro class="bullet">
					<xsl:attribute name="name">
						<xsl:text>bullet_turret_</xsl:text>
						<xsl:value-of select="./@size" />
						<xsl:text>_</xsl:text>
						<xsl:value-of select="./@type" />
						<xsl:text>_</xsl:text>
						<xsl:value-of select="./@user" />
						<xsl:text>_T</xsl:text>
						<xsl:value-of select="../@level" />
						<xsl:text>_macro</xsl:text>
					</xsl:attribute>
					<component>
						<xsl:attribute name="ref">
							<xsl:value-of select="./bulleteffects/@component" />
						</xsl:attribute>
					</component>
					<properties>
						<identification unique="0" />
						<!-- not implemenmted yet since i am not yet sure what it does
						<ammunition value="2" reload="1.9" /-->
						<bullet>
							<xsl:attribute name="speed">
								<xsl:value-of select="./bullet/@speed" />
							</xsl:attribute>
							<xsl:attribute name="lifetime">
								<xsl:value-of select="./bullet/@lifetime" />
							</xsl:attribute>
							<xsl:attribute name="range">
								<xsl:value-of select="./bullet/@range" />
							</xsl:attribute>
							<xsl:attribute name="amount">
								<xsl:value-of select="./bullet/@amount" />
							</xsl:attribute>
							<xsl:attribute name="barrelamount">
								<xsl:value-of select="./bullet/@barrelamount" />
							</xsl:attribute>
							<xsl:if test="./bullet/@timediff" >
								<xsl:attribute name="timediff">
									<xsl:value-of select="./bullet/@timediff" />
								</xsl:attribute>
							</xsl:if>
							<xsl:attribute name="angle">
								<xsl:value-of select="./bullet/@angle" />
							</xsl:attribute>
							<xsl:attribute name="maxhits">
								<xsl:value-of select="./bullet/@maxhits" />
							</xsl:attribute>
							<xsl:attribute name="riochet">
								<xsl:value-of select="./bullet/@riochet" />
							</xsl:attribute>
							<xsl:attribute name="scale">
								<xsl:value-of select="./bullet/@scale" />
							</xsl:attribute>
							<xsl:attribute name="attach">
								<xsl:value-of select="./bullet/@attach" />
							</xsl:attribute>
						</bullet>
						<reload rate="10" />
						<damage value="450" repair="0" />
						<effects>
							<impact ref="plasmaemitter_xenon_impact" inside="plasmaemitter_impact_inside" />
							<launch ref="plasmaemitter_xenon_muzzle" />
						</effects>
						<weapon system="turret_midrange" />
					</properties>
				</macro>
			</xsl:for-each>
		</macros>
	</xsl:template>
</xsl:stylesheet>
