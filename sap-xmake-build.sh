#!/bin/bash -l

# find this script and establish base directory
SCRIPT_DIR="$( dirname "${BASH_SOURCE[0]}" )"
cd "$SCRIPT_DIR" &> /dev/null
MY_DIR="$(pwd)"
echo "[INFO] Executing in ${MY_DIR}"

# PATH does not contain mvn and protobuf in this login shell
export M2_HOME=/opt/mvn3
export JAVA_HOME=/opt/sapjvm_7
export PATH=$M2_HOME/bin:$JAVA_HOME/bin:$PATH
export PATH=/opt/protobuf/bin:$PATH
export NODE_DOWNLOAD_ROOT=$XMAKE_IMPORTREPO_COMMON/org/nodejs/download/node/node/
export NPM_DOWNLOAD_ROOT=$XMAKE_IMPORTREPO_COMMON/org/nodejs/download/npm/npm/
mvn -version

cd $MY_DIR

#------------------------------------------------------------------------------
#
#  ***** compile and package tez *****
#
#------------------------------------------------------------------------------

# allowing to install bower as root and updating the registry URL to avoid 502
#echo '{ "allow_root": true, "registry": "https://registry.bower.io" }' > /root/.bowerrc
echo '{ "allow_root": true, "registry": "http://nexus.wdf.sap.corp:8081/nexus/content/groups/build.milestones.npm/" }' > /root/.bowerrc

cat <<EOT >> /root/.npmrc
registry=http://nexus.wdf.sap.corp:8081/nexus/content/groups/build.milestones.npm/
phantomjs_cdnurl=http://nexus.wdf.sap.corp:8081/nexus/content/groups/build.snapshots/com/github/klieber/phantomjs/1.9.8/
unsafe-perm=true
EOT

HADOOP_VERSION="${HADOOP_VERSION:-2.7.7}"
SKIPTESTS_BOOL=true
IGNORE_TESTFAILURES_BOOL=true
env
MVN_SKIPTESTS_BOOL=${SKIPTESTS_BOOL:-false}
if [ "${MVN_SKIPTESTS_BOOL}" != "true" ] ; then
    MVN_SKIPTESTS_BOOL=false
fi

MVN_IGNORE_TESTFAILURES_BOOL=${IGNORE_TESTFAILURES_BOOL:-false}
if [ "${MVN_IGNORE_TESTFAILURES_BOOL}" != "true" ] ; then
    MVN_IGNORE_TESTFAILURES_BOOL=false
fi

mvn -X clean -PcleanUICache package -Dtar \
-Dmaven.test.skip=${MVN_SKIPTESTS_BOOL} \
-DskipTests=${MVN_SKIPTESTS_BOOL} \
-Dmaven.test.failure.ignore=${MVN_IGNORE_TESTFAILURES_BOOL} \
-DtestFailureIgnore=${MVN_IGNORE_TESTFAILURES_BOOL} \
-Dmaven.javadoc.skip=true \
-DnodeDownloadRoot=$NODE_DOWNLOAD_ROOT \
-DnpmDownloadRoot=$NPM_DOWNLOAD_ROOT$(mvn -q -Dexec.executable="echo" -Dexec.args='${npmVersion}' --non-recursive exec:exec)/

if [[ "$?" -ne 0 ]] ; then
  echo 'Error compiling and packaging tez'; exit 1
fi

#------------------------------------------------------------------------------
#
#  ***** setup the environment for generating TEZ RPM via fpm *****
#
#------------------------------------------------------------------------------

ALTISCALE_RELEASE="${ALTISCALE_RELEASE:-5.0.0}"
TEZ_VERSION="${TEZ_VERSION:-0.8.4}"
ARTIFACT_VERSION="$TEZ_VERSION"
DATE_STRING=`date +%Y%m%d%H%M%S`
GIT_REPO="https://github.com/Altiscale/tez"

INSTALL_DIR="$MY_DIR/tezrpmbuild"
mkdir --mode=0755 -p ${INSTALL_DIR}

export RPM_NAME=`echo alti-tez-${ARTIFACT_VERSION}`
export RPM_DESCRIPTION="Apache Tez ${ARTIFACT_VERSION}\n\n${DESCRIPTION}"
export RPM_DIR="${RPM_DIR:-"${INSTALL_DIR}/tez-artifact/"}"
mkdir --mode=0755 -p ${RPM_DIR}

echo "Packaging tez rpm with name ${RPM_NAME} with version ${ARTIFACT_VERSION}-${DATE_STRING}"

export RPM_BUILD_DIR="${INSTALL_DIR}/opt/tez-${TEZ_VERSION}"
mkdir --mode=0755 -p ${RPM_BUILD_DIR}
mkdir --mode=0755 -p ${INSTALL_DIR}/etc/tez
cd ${RPM_BUILD_DIR}
mkdir --mode=0755 lib

export DIST_DIR="${MY_DIR}/tez-dist/target"
cp ${DIST_DIR}/tez-${TEZ_VERSION}.tar.gz .
cp ${DIST_DIR}/tez-${TEZ_VERSION}-minimal.tar.gz .
tar xvf tez-${TEZ_VERSION}-minimal.tar.gz

cd ${RPM_DIR}

fpm --verbose \
--maintainer support@altiscale.com \
--vendor Altiscale \
--provides ${RPM_NAME} \
--description "$(printf "${RPM_DESCRIPTION}")" \
--replaces alti-tez-${ARTIFACT_VERSION} \
--replaces vcc-tez \
--url "${GITREPO}" \
--license "Apache License v2" \
--epoch 1 \
-s dir \
-t rpm \
-n ${RPM_NAME} \
-v ${ALTISCALE_RELEASE} \
--iteration ${DATE_STRING} \
--rpm-user root \
--rpm-group root \
-C ${INSTALL_DIR} \
opt etc

exit 0
