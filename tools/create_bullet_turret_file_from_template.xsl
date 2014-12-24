<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method='xml'/>
	<xsl:template match="/">
		<macros>
			<xsl:for-each select="weaponsystems/tech/turret">
				<macro class="bullet">
					<xsl:attribute name="name">
						<xsl:text>xri_bullet_</xsl:text>
						<xsl:value-of select="name(.)" />
						<xsl:text>_</xsl:text>
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
							<xsl:value-of select="./bullet/effects/@component" />
						</xsl:attribute>
					</component>
					<properties>
						<identification unique="0" />
						<xsl:if test="./bullet/optional/@ammunition_value and ./bullet/optional/@ammunition_reload">
							<ammunition>
								<xsl:attribute name="value">
									<xsl:value-of select="./bullet/optional/@ammunition_value" />
								</xsl:attribute>
								<xsl:attribute name="reload">
									<xsl:value-of select="./bullet/optional/@ammunition_reload" />
								</xsl:attribute>
							</ammunition>
						</xsl:if>
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
							<xsl:if test="./bullet/optional/@timediff" >
								<xsl:attribute name="timediff">
									<xsl:value-of select="./bullet/optional/@timediff" />
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="./bullet/optional/@angle" >
								<xsl:attribute name="angle">
									<xsl:value-of select="./bullet/optional/@angle" />
								</xsl:attribute>
							</xsl:if>
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
							<xsl:if test="./bullet/optional/@selfdestruct" >
								<xsl:attribute name="selfdestruct">
									<xsl:value-of select="./bullet/optional/@selfdestruct" />
								</xsl:attribute>
							</xsl:if>
						</bullet>
						<reload>
							<xsl:attribute name="rate" >
								<xsl:value-of select="./bullet/@reload"/>
							</xsl:attribute>
						</reload>
						<xsl:if test="./bullet/optional/@areadamage" >
							<areadamage>
								<xsl:attribute name="value">
									<xsl:value-of select="./bullet/optional/@areadamage" />
								</xsl:attribute>
							</areadamage>
						</xsl:if>
						<damage>
							<xsl:attribute name="value" >
								<xsl:value-of select="./bullet/@damage"/>
							</xsl:attribute>
							<xsl:if test="./bullet/optional/@repair" >
								<xsl:attribute name="repair">
									<xsl:value-of select="./bullet/optional/@repair" />
								</xsl:attribute>
							</xsl:if>
							<xsl:if test="./bullet/optional/@multiplier_mining" >
								<multiplier>
									<xsl:attribute name="mining">
										<xsl:value-of select="./bullet/optional/@multiplier_mining"/>
									</xsl:attribute>
								</multiplier>
							</xsl:if>
						</damage>
						<effects>
							<impact>
								<xsl:attribute name="ref" >
									<xsl:value-of select="./bullet/effects/@impact"/>
								</xsl:attribute>
								<xsl:if test="./bullet/effects/@impact_inside" >
									<xsl:attribute name="inside">
										<xsl:value-of select="./bullet/effects/@impact_inside" />
									</xsl:attribute>
								</xsl:if>
							</impact>
							<launch>
								<xsl:attribute name="ref" >
									<xsl:value-of select="./bullet/effects/@launch"/>
								</xsl:attribute>
							</launch>
						</effects>
						<weapon>
							<xsl:attribute name="system" >
								<xsl:value-of select="./bullet/effects/@system"/>
							</xsl:attribute>
						</weapon>
					</properties>
				</macro>
			</xsl:for-each>
		</macros>
	</xsl:template>
</xsl:stylesheet>
