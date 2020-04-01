artifacts builderVersion: "1.1", {

  group "com.sap.bds.ats-altiscale", {

    artifact "tez", {
      file "${gendir}/src/tezrpmbuild/tez-artifact/alti-tez-${buildVersion}.rpm"
    }
  }
}
