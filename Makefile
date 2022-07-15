PORTNAME=	panda3d
DISTVERSION=	g20220519
CATEGORIES=	games gameengines
PKGNAMESUFFIX=	-dev
DISTNAME=	${PORTNAME}-${GH_TAGNAME}
DIST_SUBDIR=	${PORTNAME}${PKGNAMESUFFIX}

MAINTAINER=	nope@nothere
COMMENT=	Game engine, a framework for 3D rendering and game dev for Python, C++

LICENSE=	BSD3CLAUSE

#BUILD_DEPENDS=
#RUN_DEPENDS=
LIB_DEPENDS=	libassimp.so:multimedia/assimp \
		libOpenEXR.so:graphics/openexr \
		libpng.so:graphics/png \
		libturbojpeg.so:graphics/libjpeg-turbo \
		libharfbuzz.so:print/harfbuzz \
		libfreetype.so:print/freetype2 \
		libtiff.so:graphics/tiff \
		libBulletCollision.so:devel/bullet@double \
		libvorbis.so:audio/libvorbis \
		libode.so:devel/ode \
		libsquish.so:graphics/squish \
		libopusfile.so:audio/opusfile

USES=		cmake bison eigen:3 gnome gl jpeg ninja openal pkgconfig python:3.7-3.8 xorg
# * pkgconf
# * bison
# * png
# * jpeg-turbo
# * tiff
# * freetype2
# * harfbuzz
# * eigen
# * squish
# * openal
# * opusfile
# * libvorbis
# * libX11
# mesa-libs
# * ode
# * bullet
# * assimp
# * openexr
#
# ld: error: unable to find library -lgtk-3 #
# ld: error: unable to find library -lgdk-3
# ld: error: unable to find library -lpangocairo-1.0
# ld: error: unable to find library -lpango-1.0 #
# ld: error: unable to find library -lharfbuzz
# ld: error: unable to find library -latk-1.0
# ld: error: unable to find library -lcairo-gobject
# ld: error: unable to find library -lcairo #
# ld: error: unable to find library -lgdk_pixbuf-2.0 #
# ld: error: unable to find library -lgio-2.0
# ld: error: unable to find library -lgobject-2.0
# ld: error: unable to find library -lglib-2.0 #
# ld: error: unable to find library -lintl

USE_GL=		gl opengl
USE_GNOME=	gtk30 pango atk cairo glib20 gdkpixbuf2 
USE_XORG=	x11
#CONFLICTS=
USE_GITHUB=     nodefault
GH_ACCOUNT=     panda3d
GH_PROJECT=     panda3d
GH_TAGNAME=	36e34294cf4b196fddedb219b04857267f42f5c5

CMAKE_ARGS=	-DBUILD_UNITTESTS="FALSE" \
		-DCMAKE_BUILD_TYPE="MinSizeRel" \
		-DCUSTOM_EXAMPLE_CONF_DIR="${PREFIX}/etc" \
		-DCUSTOM_MANDIR="${PREFIX}/man" \
		-DOPENGL_xmesa_INCLUDE_DIR="${PREFIX}/lib"

WRKSRC=	${WRKDIR}/${PORTNAME}-${GH_TAGNAME}
#
# python3.7 makepanda/makepanda.py --everything --installer --no-egl --no-gles --no-gles2

.include <bsd.port.options.mk>

.include <bsd.port.mk>
