#!/bin/bash

# bower install fails to install bower packages and creates empty package folders inside app/bower_components.
# This results in an undesired directory structure.

rm -rf ${TEZ_UI_BOWERRC_DIR}/app/bower_components/*

mv ${TEZ_UI_BOWERRC_DIR}/Font-Awesome-4.2.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/font-awesome
mv ${TEZ_UI_BOWERRC_DIR}/bootstrap-3.3.1 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/bootstrap
mv ${TEZ_UI_BOWERRC_DIR}/bootstrap-for-ember-0.7.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/ember-addons.bs_for_ember
mv ${TEZ_UI_BOWERRC_DIR}/codemirror-5.2.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/codemirror
mv ${TEZ_UI_BOWERRC_DIR}/d3-bower-3.4.11 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/d3
mv ${TEZ_UI_BOWERRC_DIR}/ember-1.7.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/ember
mv ${TEZ_UI_BOWERRC_DIR}/ember-data-1.0.0-beta.11 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/ember-data
mv ${TEZ_UI_BOWERRC_DIR}/ember-i18n-2.9.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/ember-i18n
mv ${TEZ_UI_BOWERRC_DIR}/ember-json-mapper-1.0.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/ember-json-mapper
mv ${TEZ_UI_BOWERRC_DIR}/ember-table-0.2.4 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/ember-table
mv ${TEZ_UI_BOWERRC_DIR}/moment-2.10.6 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/moment
mv ${TEZ_UI_BOWERRC_DIR}/moment-timezone-0.4.0 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/moment-timezone
mv ${TEZ_UI_BOWERRC_DIR}/jqueryui-1.11.4 ${TEZ_UI_BOWERRC_DIR}/app/bower_components/jquery-ui
