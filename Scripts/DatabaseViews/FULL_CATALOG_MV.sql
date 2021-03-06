﻿-- Materialized View: "WADE_R"."FULL_CATALOG_MV"

-- DROP MATERIALIZED VIEW "WADE_R"."FULL_CATALOG_MV";

CREATE MATERIALIZED VIEW "WADE_R"."FULL_CATALOG_MV" AS 
 SELECT "FULL_CATALOG"."ORGANIZATION_ID",
    "FULL_CATALOG"."REPORT_ID",
    "FULL_CATALOG"."ALLOCATION_ID",
    "FULL_CATALOG"."DATACATEGORY",
    "FULL_CATALOG"."DATATYPE",
    "FULL_CATALOG"."STATE",
    "FULL_CATALOG"."REPORT_UNIT_ID",
    "FULL_CATALOG"."COUNTY_FIPS",
    "FULL_CATALOG"."HUC"
   FROM "WADE_R"."FULL_CATALOG"
WITH NO DATA;

ALTER TABLE "WADE_R"."FULL_CATALOG_MV"
  OWNER TO admin;
GRANT ALL ON TABLE "WADE_R"."FULL_CATALOG_MV" TO admin;
GRANT SELECT ON TABLE "WADE_R"."FULL_CATALOG_MV" TO "WADE_APP";
GRANT ALL ON TABLE "WADE_R"."FULL_CATALOG_MV" TO "WADE_ADMIN";
