#!/bin/bash

rm -rf ${TEZ_UI2_BOWERRC_DIR}/bower_components/*

mv ${TEZ_UI2_BOWERRC_DIR}/FileSaver.js-1.20150507.2 ${TEZ_UI2_BOWERRC_DIR}/bower_components/file-saver.js
mv ${TEZ_UI2_BOWERRC_DIR}/Font-Awesome-4.5.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/font-awesome
mv ${TEZ_UI2_BOWERRC_DIR}/Numeral-js-1.5.3 ${TEZ_UI2_BOWERRC_DIR}/bower_components/numeral
mv ${TEZ_UI2_BOWERRC_DIR}/bootstrap-3.3.6 ${TEZ_UI2_BOWERRC_DIR}/bower_components/bootstrap
mv ${TEZ_UI2_BOWERRC_DIR}/codemirror-5.11.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/codemirror
mv ${TEZ_UI2_BOWERRC_DIR}/ember-2.2.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember
mv ${TEZ_UI2_BOWERRC_DIR}/ember-cli-shims-0.0.6 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember-cli-shims
mv ${TEZ_UI2_BOWERRC_DIR}/ember-cli-test-loader-0.2.1 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember-cli-test-loader
mv ${TEZ_UI2_BOWERRC_DIR}/ember-data-2.1.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember-data
mv ${TEZ_UI2_BOWERRC_DIR}/ember-load-initializers-0.1.7 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember-load-initializers
mv ${TEZ_UI2_BOWERRC_DIR}/ember-qunit-builds-0.4.16 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember-qunit
mv ${TEZ_UI2_BOWERRC_DIR}/ember-qunit-notifications-0.1.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/ember-qunit-notifications
mv ${TEZ_UI2_BOWERRC_DIR}/jquery-dist-2.1.4 ${TEZ_UI2_BOWERRC_DIR}/bower_components/jquery
mv ${TEZ_UI2_BOWERRC_DIR}/jquery-mousewheel-3.1.13 ${TEZ_UI2_BOWERRC_DIR}/bower_components/jquery-mousewheel
mv ${TEZ_UI2_BOWERRC_DIR}/loader.js-3.3.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/loader.js
mv ${TEZ_UI2_BOWERRC_DIR}/moment-2.12.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/moment
mv ${TEZ_UI2_BOWERRC_DIR}/moment-timezone-0.5.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/moment-timezone
mv ${TEZ_UI2_BOWERRC_DIR}/more-js-0.8.2 ${TEZ_UI2_BOWERRC_DIR}/bower_components/more-js
mv ${TEZ_UI2_BOWERRC_DIR}/qunit-1.19.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/qunit
mv ${TEZ_UI2_BOWERRC_DIR}/snippet-ss-1.11.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/snippet-ss
mv ${TEZ_UI2_BOWERRC_DIR}/zip.js-1.0.0 ${TEZ_UI2_BOWERRC_DIR}/bower_components/zip-js

# Since jquery-ui-1.11.4 was installed as part of tez-ui, it is fetched from the cache,
# it is not present in the tez-ui2 directory.
# Hence we copy it from the tez-ui directory which has the same jquery-ui version
cp -a ${TEZ_UI_BOWERRC_DIR}/app/bower_components/jquery-ui/. ${TEZ_UI2_BOWERRC_DIR}/bower_components/jquery-ui/
