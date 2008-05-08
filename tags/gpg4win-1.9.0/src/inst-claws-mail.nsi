# inst-claws-mail.nsi - Installer snippet for Claws. -*- coding: latin-1; -*-
# Copyright (C) 2005, 2007 g10 Code GmbH
# 
# This file is part of GPG4Win.
# 
# GPG4Win is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
# 
# GPG4Win is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA


!ifdef prefix
!undef prefix
!endif
!define prefix ${ipdir}/claws-mail-${gpg4win_pkg_claws_mail_version}


${MementoUnselectedSection} "Claws-Mail" SEC_claws_mail
  SetOutPath "$INSTDIR"
!ifdef SOURCES
  File "${gpg4win_pkg_claws_mail}"
!else
  File ${prefix}/bin/claws-mail.exe

!ifndef GPG4WIN_LIGHT
  File ${prefix}/share/doc/claws-mail/manual/en/claws-mail-manual.pdf
!endif

  SetOutPath "$INSTDIR\lib\claws-mail\plugins"
  File ${prefix}/lib/claws-mail/plugins/pgpcore.dll
  File ${prefix}/lib/claws-mail/plugins/pgpinline.dll
  File ${prefix}/lib/claws-mail/plugins/pgpinline.deps
  File ${prefix}/lib/claws-mail/plugins/pgpmime.dll
  File ${prefix}/lib/claws-mail/plugins/pgpmime.deps
  File ${prefix}/lib/claws-mail/plugins/smime.dll
  File ${prefix}/lib/claws-mail/plugins/smime.deps

  SetOutPath "$INSTDIR\share\locale\de\LC_MESSAGES"
  File ${prefix}/share/locale/de/LC_MESSAGES/claws-mail.mo
!endif
${MementoSectionEnd}


LangString DESC_SEC_claws_mail ${LANG_ENGLISH} \
   "Claws Mail-User-Agent"

LangString DESC_Menu_claws_mail ${LANG_ENGLISH} \
   "Run the Claws mailprogram."

LangString DESC_Menu_claws_mail_pdf ${LANG_ENGLISH} \
   "Show the online manual of Claws Mail"