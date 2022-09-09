-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Categories" (
    "id" serial   NOT NULL,
    "category" text   NOT NULL,
    CONSTRAINT "pk_Categories" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Regions" (
    "id" serial   NOT NULL,
    "region" text   NOT NULL,
    CONSTRAINT "pk_Regions" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Users" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "region_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Users" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Posts" (
    "id" serial   NOT NULL,
    "title" text   NOT NULL,
    "text" text   NOT NULL,
    "user_id" INTEGER   NOT NULL,
    "region_id" INTEGER   NOT NULL,
    "category_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Posts" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Users" ADD CONSTRAINT "fk_Users_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_user_id" FOREIGN KEY("user_id")
REFERENCES "Users" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_region_id" FOREIGN KEY("region_id")
REFERENCES "Regions" ("id");

ALTER TABLE "Posts" ADD CONSTRAINT "fk_Posts_category_id" FOREIGN KEY("category_id")
REFERENCES "Categories" ("id");

