#
# Copyright (c) 2008--2014 Red Hat, Inc.
# Copyright (c) 2010--2011 SUSE LINUX Products GmbH, Nuernberg, Germany.
#
# This software is licensed to you under the GNU General Public License,
# version 2 (GPLv2). There is NO WARRANTY for this software, express or
# implied, including the implied warranties of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. You should have received a copy of GPLv2
# along with this software; if not, see
# http://www.gnu.org/licenses/old-licenses/gpl-2.0.txt.
#
# Red Hat trademarks are not licensed under GPLv2. No permission is
# granted to use or replicate Red Hat trademarks that are incorporated
# in this software or its documentation.
#

import base64
import imp

from spacewalk.satellite_tools.repo_plugins.yum_src import ContentSource as yum_ContentSource
from spacewalk.satellite_tools.syncLib import RhnSyncException

CACHE_DIR   = '/var/cache/rhn/reposync/'
AWSSRC_CONF = '/etc/rhn/spacewalk-repo-sync/aws.conf'

class ContentSource(yum_ContentSource):

    def __init__(self, url, name):
        yum_ContentSource.__init__(self, url, name, AWSSRC_CONF)

    def setup_repo(self, repo):
        yum_ContentSource.setup_repo(self, repo)
        self.set_rhui_headers()

    def load_yum_plugin(self, module_name):
        module = None
        try:
            fp, pathname, description = imp.find_module(module_name, ['/usr/lib/yum-plugins'])
            try:
                module = imp.load_module(module_name, fp, pathname, description)
            finally:
                fp.close()
        except:
            pass
        return module

    def set_rhui_headers(self):
        amazon_id_plugin = self.load_yum_plugin('amazon-id')
        if amazon_id_plugin is None:
            raise RhnSyncException("cannot load required yum plugin 'amazon-id'")

        id_doc = amazon_id_plugin._load_id()
        id_sig = amazon_id_plugin._load_signature()

        if id_doc and id_sig:
            id_doc = base64.urlsafe_b64encode(id_doc)
            id_sig = base64.urlsafe_b64encode(id_sig)
            self.repo.http_headers[amazon_id_plugin.ID_DOC_HEADER] = id_doc
            self.repo.http_headers[amazon_id_plugin.ID_SIG_HEADER] = id_sig
