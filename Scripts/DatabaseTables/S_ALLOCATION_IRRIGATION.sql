﻿-- Table: "WADE"."S_ALLOCATION_IRRIGATION"

-- DROP TABLE "WADE"."S_ALLOCATION_IRRIGATION";

CREATE TABLE "WADE"."S_ALLOCATION_IRRIGATION"
(
  "ORGANIZATION_ID" character varying(10) NOT NULL, -- Unique identifier assigned to the organization.
  "REPORT_ID" character varying(35) NOT NULL, -- Unique identifier assigned to the report by the organization.
  "REPORT_UNIT_ID" character varying(35) NOT NULL, -- Unique identifier for the reporting unit.
  "SUMMARY_SEQ" numeric(18,0) NOT NULL,
  "IRRIGATION_SEQ" numeric(18,0) NOT NULL,
  "IRRIGATION_METHOD" numeric(18,0),
  "ACRES_IRRIGATED" numeric(18,3) NOT NULL,
  "CROP_TYPE" numeric(18,0),
  CONSTRAINT "PK_S_ALLOCATION_IRRIGATION" PRIMARY KEY ("ORGANIZATION_ID", "REPORT_ID", "REPORT_UNIT_ID", "SUMMARY_SEQ", "IRRIGATION_SEQ"),
  CONSTRAINT "FK_S_ALLOCATION_IRRIGATION-LU_CROP_TYPE" FOREIGN KEY ("CROP_TYPE")
      REFERENCES "WADE"."LU_CROP_TYPE" ("LU_SEQ_NO") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "FK_S_ALLOCATION_IRRIGATION-LU_IRRIGATION_METHOD" FOREIGN KEY ("IRRIGATION_METHOD")
      REFERENCES "WADE"."LU_IRRIGATION_METHOD" ("LU_SEQ_NO") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT "FK_S_ALLOCATION_IRRIGATION-SUMMARY_ALLOCATION" FOREIGN KEY ("ORGANIZATION_ID", "REPORT_ID", "REPORT_UNIT_ID", "SUMMARY_SEQ")
      REFERENCES "WADE"."SUMMARY_ALLOCATION" ("ORGANIZATION_ID", "REPORT_ID", "REPORT_UNIT_ID", "SUMMARY_SEQ") MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE "WADE"."S_ALLOCATION_IRRIGATION"
  OWNER TO "WADE";
COMMENT ON TABLE "WADE"."S_ALLOCATION_IRRIGATION"
  IS 'Additional metadata for irrigation water supply uses.';
COMMENT ON COLUMN "WADE"."S_ALLOCATION_IRRIGATION"."ORGANIZATION_ID" IS 'Unique identifier assigned to the organization.';
COMMENT ON COLUMN "WADE"."S_ALLOCATION_IRRIGATION"."REPORT_ID" IS 'Unique identifier assigned to the report by the organization.';
COMMENT ON COLUMN "WADE"."S_ALLOCATION_IRRIGATION"."REPORT_UNIT_ID" IS 'Unique identifier for the reporting unit.';


-- Index: "WADE"."FKI_S_ALLOCATION_IRRIGATION-LU_CROP_TYPE"

-- DROP INDEX "WADE"."FKI_S_ALLOCATION_IRRIGATION-LU_CROP_TYPE";

CREATE INDEX "FKI_S_ALLOCATION_IRRIGATION-LU_CROP_TYPE"
  ON "WADE"."S_ALLOCATION_IRRIGATION"
  USING btree
  ("CROP_TYPE");

-- Index: "WADE"."FKI_S_ALLOCATION_IRRIGATION-LU_IRRIGATION_METHOD"

-- DROP INDEX "WADE"."FKI_S_ALLOCATION_IRRIGATION-LU_IRRIGATION_METHOD";

CREATE INDEX "FKI_S_ALLOCATION_IRRIGATION-LU_IRRIGATION_METHOD"
  ON "WADE"."S_ALLOCATION_IRRIGATION"
  USING btree
  ("IRRIGATION_METHOD");

-- Index: "WADE"."FKI_S_ALLOCATION_IRRIGATION-SUMMARY_ALLOCATION"

-- DROP INDEX "WADE"."FKI_S_ALLOCATION_IRRIGATION-SUMMARY_ALLOCATION";

CREATE INDEX "FKI_S_ALLOCATION_IRRIGATION-SUMMARY_ALLOCATION"
  ON "WADE"."S_ALLOCATION_IRRIGATION"
  USING btree
  ("ORGANIZATION_ID" COLLATE pg_catalog."default", "REPORT_ID" COLLATE pg_catalog."default", "REPORT_UNIT_ID" COLLATE pg_catalog."default", "SUMMARY_SEQ");

