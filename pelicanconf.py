#!/usr/bin/env python
# -*- coding: utf-8 -*- #

AUTHOR = u'Xavier Gillard'
TRADUCTEUR = u'Xavier Gillard'
SITENAME = u'Il faut réformer le droit d\'auteur'
SITEURL = 'http://rda.sploing.fr'
THEME = "nmnlist"
TWITTER_USERNAME = "sploinga"
FACEBOOK_USERNAME = "xavierlunon"
TIMEZONE = 'Europe/Paris'
OUTPUT_PATH = "htdocs"
DEFAULT_LANG = u'fr'
TYPOGRIFY = True
SUMMARY_MAX_LENGTH = ""
ARTICLE_URL = "{category}/{date:%Y}/{date:%m}/{date:%d}/{slug}/"
ARTICLE_SAVE_AS = "{category}/{date:%Y}/{date:%m}/{date:%d}/{slug}/index.html"
CATEGORY_URL = 'categorie/{slug}.html'
CATEGORY_SAVE_AS = 'categorie/{slug}.html'
AUTHOR_URL = 'auteur/{slug}.html'
AUTHOR_SAVE_AS = 'auteur/{slug}.html'
TRADUCTEUR_URL = 'traducteur/{slug}.html'
TRADUCTEUR_SAVE_AS = 'traducteur/{slug}.html'
DISQUS_SITENAME = "refda"

RELATIVE_URLS = True
LOCALE = "fr_FR.UTF-8"
FEED_DOMAIN = SITEURL
#CATEGORY_FEED_ATOM = "feeds/{category}.atom.xml"
FEED_MAX_ITEMS = "15"
DISPLAY_PAGES_ON_MENU = False
DEFAULT_PAGINATION = 10

#fonction jinja supplémentaire

from urllib import quote_plus
from jinja2.utils import Markup, escape, soft_unicode

def do_urlencode(value):
    if type(value) == 'Markup':
    	value = value.unescape()
    value = value.encode('utf8')
    value = quote_plus(value)
    return Markup(value)

JINJA_FILTERS = {'urlencode': do_urlencode}

#plugins et social

PLUGINS = ['pelican.plugins.global_license','pelican.plugins.gzip_cache','pelican.plugins.sitemap']

LICENSE = '<a href="http://creativecommons.org/licenses/by-sa/2.0/fr/"><i class="icon-legal"></i> CC-BY-SA</a>'
# Social widget
SOCIAL = (('twitter', 'https://twitter.com/sploinga'),
			("foursquare", "https://foursquare.com/sploinga"),
			("github", "https://github.com/sploinga"),
			("lastfm", "https://last.fm/user/xalunon"),
			('flickr', 'https://www.flickr.com/photos/sploinga'),
			("senscritique", "http://senscritique.com/sploinga"),
			('facebook', 'https://facebook.com/xavierlunon'))

APROPOS = (('Quels textes ?', '/pages/quels-textes.html', "icon-question-sign"),
			("Licence", "/pages/licence.html", "icon-legal"),
			("Participer", "/pages/participer.html", "icon-beer"))

LIVRES = ((u"Sur la réforme du droit d'auteur", 'http://reformedroitauteur.sploing.fr/'),
			(u"Contre la propriété intellectuelle", "http://contrelaproprieteintellectuelle.sploing.fr/"))

SITES = ((u"Diverses traductions", "http://traductions.sploing.fr"),
		(u"Politique du Netz","http://politiquedunetz.sploing.fr"))

SITEMAP = {
    'format': 'xml',
    'priorities': {
        'articles': 0.5,
        'indexes': 0.5,
        'pages': 0.5
    },
    'changefreqs': {
        'articles': 'monthly',
        'indexes': 'weekly',
        'pages': 'monthly'
    }
}
