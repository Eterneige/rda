<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" result-ns="html">
<xsl:key name="couleur-deputes" match="depute" use="parti_ratt_financier" />
<xsl:key name="deputes-par-circo" match="depute" use="nom_circo" />
<xsl:template match="/">

<html   lang="fr"
	prefix="fb: http://www.facebook.com/2008/fbml"
	xmlns="http://www.w3.org/1999/xhtml" 
>
  <head>
  <link rel="stylesheet" href="http://rda.sploing.fr/theme/css/main.css" type="text/css" />

    <title>Il faut réformer le droit d'auteur ! - Liste des députés à prendre en charge</title>

  </head>
<body>

<div class="pub">
<a class="projet" href="http://fr.ulule.com/ref-da"><i class="icon-book icon-large"></i>Envoyez un livre sur la réforme du droit d'auteur à votre député !</a>
<ul class="liens">
<li><a href="http://rda.sploing.fr/wiki"><i class="icon-edit icon-large"></i>Version wiki éditable</a></li>
<li><a href="http://fichiers.sploing.fr/résumé.pdf"><i class="icon-download icon-large"></i>Version PDF imprimable</a></li>
<li><a href="http://github.com/sploinga/rda"><i class="icon-github icon-large"></i>Code source modifiable</a></li>
</ul>
</div>

<article>
<header><h1>Liste des députés à prendre en charge</h1></header>

<paragraph><p>La liste des députés est triée ci-dessous par département. </p>
<p>Les députés qui sont déjà pris en charge sont repérés par l'icône <i class="icon-thumbs-up icon-large"></i>. </p>
<p>Les députés restants sont repérés par <i class="icon-warning-sign icon-large"></i></p>
<p>Pour prendre en charge un député, <a href="http://fr.ulule.com/ref-da">participez</a> puis envoyez-moi un mail à <a href="mailto:xavier@sploing.fr?Subject=Choix de député(es)">xavier@sploing.fr</a> pour me signaler votre choix.</p>
</paragraph>
<ul>
	<xsl:for-each select="deputes/depute[count(. | key('deputes-par-circo', nom_circo)[1]) = 1]">
		<xsl:sort select="nom_circo" />
		<li style="clear:both;margin-bottom:1.5em"><xsl:value-of select="nom_circo" /><ul style="list-style-type:none;">
		<xsl:for-each select="key('deputes-par-circo', nom_circo)">
			<xsl:sort select="nom_de_famille" />
			<xsl:choose>
				<xsl:when test="pris > 0">
					<li style="clear:both;margin-bottom:1em;">
						<img style="float:left;clear:left;margin-right:1em;border-radius:0.2em">
						<xsl:attribute name="src">
							<xsl:value-of select="url_image"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="nom_de_famille"/>
						</xsl:attribute>
						</img>
						<i style="color:green" class="icon-thumbs-up icon-large"></i><xsl:value-of select="prenom" /><xsl:text> </xsl:text><xsl:value-of select="nom_de_famille" /><xsl:text> est pris(e) en charge par </xsl:text><xsl:value-of select="soutien" /><xsl:text> </xsl:text>
							<xsl:if test="soutientw !=''"><a><xsl:attribute name="href"><xsl:value-of select="soutientw"/></xsl:attribute><i class="icon-twitter icon-large"></i></a></xsl:if><br/>
						<i class="icon-envelope icon-large"></i><xsl:value-of select="emails/email" /><br/>
						<i class="icon-info icon-large"></i><xsl:value-of select="profession" /><xsl:text> </xsl:text><a><xsl:attribute name="href"><xsl:value-of select="url_an"/></xsl:attribute><i class="icon-external-link  icon-large"></i></a><br/>
					</li> 
				</xsl:when>
				<xsl:otherwise>
					<li style="margin-bottom:1em;clear:both">
						<img style="float:left;clear:left;margin-right:1em;border-radius:0.2em">
						<xsl:attribute name="src">
							<xsl:value-of select="url_image"/>
						</xsl:attribute>
						<xsl:attribute name="alt">
							<xsl:value-of select="nom_de_famille"/>
						</xsl:attribute>
						</img>
						<i style="color:red" class="icon-warning-sign icon-large"></i><xsl:value-of select="prenom" /><xsl:text> </xsl:text><xsl:value-of select="nom_de_famille" /><br/>
						<i class="icon-envelope icon-large"></i><xsl:value-of select="emails/email" /><br/>
						<i class="icon-info icon-large"></i><xsl:value-of select="profession" /><xsl:text> </xsl:text><a><xsl:attribute name="href"><xsl:value-of select="url_an"/></xsl:attribute><i class="icon-external-link  icon-large"></i></a><br/>
					</li> 
				</xsl:otherwise>
			</xsl:choose>
		</xsl:for-each>
	</ul></li></xsl:for-each>
</ul>
</article>
	

        <footer>
                <ul>
                                    <li><a href="http://rda.sploing.fr/pages/licence.html">Licence</a> </li>
                                    <li><a href="http://rda.sploing.fr/pages/participer.html">Participer</a></li>
                		<li><a href="http://rda.sploing.fr/archives.html">Archives</a></li>
                </ul>
        </footer>

</body>
</html>
</xsl:template >
</xsl:stylesheet>
