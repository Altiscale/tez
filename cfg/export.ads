artifacts builderVersion: "1.1", {

  group "com.sap.bds.ats-altiscale", {

    artifact "tez", {
      file "$gendir/out/src/tezrpmbuild/tez-artifact/alti-tez-*.rpm"
    }
  }
}
