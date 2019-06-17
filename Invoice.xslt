
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:variable name="InvoiceBodyType">
    <xsl:choose>
        <xsl:when test="//transaction[@name='Priority']">SuperInvoice</xsl:when>
        <xsl:otherwise>NormalInvoice</xsl:otherwise>
    </xsl:choose>
</xsl:variable>

<xsl:template match="/">
    <html>
        <body>
            <table>
                <tbody>
                    <xsl:apply-templates select="//transaction"/>
                </tbody>
            </table>
        </body>
    </html>
</xsl:template>

<xsl:template match="transaction">
    <tr>
        <td><xsl:value-of select="person"/></td>
        <td><xsl:value-of select="value"/></td>
    </tr>
</xsl:template>

</xsl:stylesheet>