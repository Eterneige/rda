<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:key name="deputes-par-circo" match="depute" use="nom_circo" />
<xsl:template match="/">

<html   lang="fr"
	prefix="fb: http://www.facebook.com/2008/fbml"
	xmlns="http://www.w3.org/1999/xhtml" 
>
  <head>
  <link rel="stylesheet" href="http://rda.sploing.fr/theme/css/main.css" type="text/css" />

    <title>Il faut réformer le droit d'auteur ! - Liste des député(e)s à prendre en charge</title>

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
<header><h1>Liste des député(e)s à prendre en charge</h1></header>

<paragraph>
<p>L'envoi des livres à tous les député(e)s est assuré. Mais le suivi personnalisé de tous/toutes n'est pas encore assuré. Vous pouvez prendre en charge maximum 25 député(e)s en fonction du montant de <a href="http://fr.ulule.com/ref-da/">votre participation</a>. La barre suivante indique combien seront pris en charge directement par des soutiens.</p>

<svg width="80%" height="2em" style="margin-left:10%;margin-right:10%"  xmlns="http://www.w3.org/2000/svg">
  <rect rx="5" ry="5" width="100%" height="20" fill="red"/>
    <rect rx="5" width="53%" height="20" fill="green"/>
    </svg>

<p style="text-align:center">309 sur 577 à ce jour</p>

<p>Après avoir financé le projet, il faut que vous disiez quel(le)s député(e)s en particulier vous intéressent. Cela sert à répartir au mieux les soutiens. La barre suivante indique le nombre de député(e)s déjà réservé(e)s.</p>
<svg width="80%" height="2em" style="margin-left:10%;margin-right:10%" xmlns="http://www.w3.org/2000/svg">
		<xsl:variable name="compteur" select="count(deputes/depute[pris = 1])" />
  <rect rx="5" ry="5" width="100%" height="20" fill="red"/>
    <rect rx="5" width="{$compteur div 577 * 100}%" height="20" fill="green"/>
    </svg>

<p  style="text-align:center"><xsl:value-of select="count(deputes/depute[pris = 1])" /> sur 577 à ce jour</p>

<p>La liste ci-dessous détaille qui est pris en charge par qui. Elle est triée par département. </p>
<ul><li>Les député(e)s qui sont déjà pris(e) en charge sont repéré(e)s par l'icône <i class="icon-thumbs-up icon-large"></i>. </li>
<li>Les député(e)s restant(e)s sont repéré(e)s par <i class="icon-warning-sign icon-large"></i></li></ul>
<p>Pour prendre en charge un(e) député(e), <a href="http://fr.ulule.com/ref-da">participez</a> puis envoyez-moi un mail à <a href="mailto:xavier@sploing.fr?Subject=Choix de député(es)">xavier@sploing.fr</a> pour me signaler votre choix.</p>
<p>Si vous êtes deux ou plus à vouloir prendre en charge le même député :
<ul>
<li>L'un(e) d'entre vous habite dans la circonscription au contraire des autres ou a un lien particulier avec le député <br/>&#8594; Serait-il possible de lui laisser la priorité ?</li>
<li>Vous tenez tous à contacter la/le même député(e)<br/> &#8594; On peut joindre plusieurs lettres en même temps. Ou faire une lettre commune. Discutez-en entre vous, je vous mets en contact !</li></ul></p>

<p>Aller directement à un département : </p>
<ul>
<xsl:for-each select="deputes/depute[count(. | key('deputes-par-circo', nom_circo)[1]) = 1]">
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
	<xsl:for-each select="deputes/depute[count(. | key('deputes-par-circo', nom_circo)[1]) = 1]">
		<xsl:sort select="nom_circo" />
		<li style="clear:both;margin-bottom:1.5em">
		<xsl:attribute name="id"><xsl:value-of select="nom_circo"/></xsl:attribute>
		<xsl:value-of select="nom_circo" />
		<ul style="list-style-type:none;">
		<xsl:for-each select="key('deputes-par-circo', nom_circo)">
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
