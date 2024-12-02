<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>

	<xsl:template match="/">
		<html>
			<head>
				<title>Список студентів</title>
				<style>
					table {
					border-collapse: collapse;
					width: 100%;
					}
					th, td {
					border: 1px solid black;
					padding: 8px;
					text-align: left;
					}
					th {
					background-color: #f2f2f2;
					}
				</style>
			</head>
			<body>
				<h2>Список студентів</h2>
				<table>
					<thead>
						<tr>
							<th>Повне ім'я</th>
							<th>Дисципліна</th>
							<th>Викладач</th>
							<th>Спеціалізація</th>
							<th>Група</th>
							<th>Оцінка</th>
						</tr>
					</thead>
					<tbody>
						<xsl:for-each select="Students/Student">
							<tr>
								<td>
									<xsl:value-of select="@FullName"/>
								</td>
								<td>
									<xsl:value-of select="@Discipline"/>
								</td>
								<td>
									<xsl:value-of select="@Teacher"/>
								</td>
								<td>
									<xsl:value-of select="@Specialization"/>
								</td>
								<td>
									<xsl:value-of select="@Group"/>
								</td>
								<td>
									<xsl:for-each select="Discipline">
										<xsl:value-of select="@Grade"/>
										<xsl:if test="position() != last()">, </xsl:if>
									</xsl:for-each>
								</td>
							</tr>
						</xsl:for-each>
					</tbody>
				</table>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
