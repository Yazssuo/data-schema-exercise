-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Doctors" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    CONSTRAINT "pk_Doctors" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Patients" (
    "id" serial   NOT NULL,
    "name" string   NOT NULL,
    "diseases" integer   NOT NULL,
    CONSTRAINT "pk_Patients" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Records" (
    "id" serial   NOT NULL,
    "doctor_id" INTEGER   NOT NULL,
    "patient_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Records" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Records" ADD CONSTRAINT "fk_Records_doctor_id" FOREIGN KEY("doctor_id")
REFERENCES "Doctors" ("id");

ALTER TABLE "Records" ADD CONSTRAINT "fk_Records_patient_id" FOREIGN KEY("patient_id")
REFERENCES "Patients" ("id");

CREATE INDEX "idx_Doctors_name"
ON "Doctors" ("name");

CREATE INDEX "idx_Patients_name"
ON "Patients" ("name");

