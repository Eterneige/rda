<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name="senateurs-par-circo" match="senateur" use="nom_circo" />
<xsl:template match="/">

<html   lang="fr"
	prefix="fb: http://www.facebook.com/2008/fbml"
	xmlns="http://www.w3.org/1999/xhtml" 
>
  <head>
  <link rel="stylesheet" href="http://rda.sploing.fr/theme/css/main.css" type="text/css" />

    <title>Il faut réformer le droit d'auteur ! - Liste des sénateurices à prendre en charge</title>

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
<header><h1>Liste des sénateurices à prendre en charge</h1></header>

<paragraph>
<p>L'envoi des livres à tous les <a href="http://www.senat.fr/commission/cult/">sénateurices de la commission culturelle</a> est assuré. Mais le suivi personnalisé de tous/toutes n'est pas encore assuré. Après avoir financé le projet, il faut que vous disiez quel(le)s sénateurices en particulier vous intéressent. Cela sert à répartir au mieux les soutiens. La barre suivante indique le nombre de sénateurices déjà réservé(e)s. N'hésitez à pas vous concerter à plusieurs pour les réserver !</p>
<svg width="80%" height="2em" style="margin-left:10%;margin-right:10%" xmlns="http://www.w3.org/2000/svg">
		<xsl:variable name="compteur" select="count(senateurs/senateur[pris = 1])" />
  <rect rx="5" ry="5" width="100%" height="20" fill="red"/>
    <rect rx="5" width="{$compteur div 57 * 100}%" height="20" fill="green"/>
    </svg>

<p  style="text-align:center"><xsl:value-of select="count(senateurs/senateur[pris = 1])" /> sur 57 à ce jour</p>

<p>La liste ci-dessous détaille qui est pris en charge par qui. Elle est triée par département. </p>
<ul><li>Les sénateurices qui sont déjà pris(e) en charge sont repéré(e)s par l'icône <i class="icon-thumbs-up icon-large"></i>. </li>
<li>Les sénateurices restant(e)s sont repéré(e)s par <i class="icon-warning-sign icon-large"></i></li></ul>
<p>Pour prendre en charge un(e) sénateurice, <a href="http://fr.ulule.com/ref-da">participez</a> puis envoyez-moi un mail à <a href="mailto:xavier@sploing.fr?Subject=Choix de sénateurices">xavier@sploing.fr</a> pour me signaler votre choix.</p>
<p>Il n'y a pas de souci si vous êtes deux ou plus à vouloir prendre en charge la même sénateurice. Je vous mets en contact.</p>

<p>Aller directement à un département : </p>
<ul>
<xsl:for-each select="senateurs/senateur[count(. | key('senateurs-par-circo', nom_circo)[1]) = 1]">
	<xsl:sort select="nom_circo" />
	<li style="display:inline"><a>
				<xsl:attribute name="href">
					#<xsl:value-of select="nom_circo"/>
				</xsl:attribute><xsl:value-of select="nom_circo"/></a><xsl:text> </xsl:text>
	</li>
</xsl:for-each>
</ul>
</paragraph>


<ul>
	<xsl:for-each select="senateurs/senateur[count(. | key('senateurs-par-circo', nom_circo)[1]) = 1]">
		<xsl:sort select="nom_circo" />
		<li style="clear:both;margin-bottom:1.5em">
		<xsl:attribute name="id"><xsl:value-of select="nom_circo"/></xsl:attribute>
		<xsl:value-of select="nom_circo" />
		<ul style="list-style-type:none;">
		<xsl:for-each select="key('senateurs-par-circo', nom_circo)">
			<xsl:sort select="nom_de_famille" />
			<xsl:choose>
				<xsl:when test="pris > 0">
					<li style="clear:both;margin-bottom:1em;margin-top:1em">
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
