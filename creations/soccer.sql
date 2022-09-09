-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Referees" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Referees" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Teams" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    CONSTRAINT "pk_Teams" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Seasons" (
    "id" serial   NOT NULL,
    "start_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    CONSTRAINT "pk_Seasons" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Games" (
    "id" serial   NOT NULL,
    "team1_id" INTEGER   NOT NULL,
    "team2_id" INTEGER   NOT NULL,
    "referee_id" INTEGER   NOT NULL,
    "season_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Games" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Results" (
    "id" serial   NOT NULL,
    "result" text   NOT NULL,
    "game_id" INTEGER   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Results" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Players" (
    "id" serial   NOT NULL,
    "name" text   NOT NULL,
    "team_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Players" PRIMARY KEY (
        "id"
     )
);

CREATE TABLE "Goals" (
    "id" serial   NOT NULL,
    "player_id" INTEGER   NOT NULL,
    "game_id" INTEGER   NOT NULL,
    CONSTRAINT "pk_Goals" PRIMARY KEY (
        "id"
     )
);

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team1_id" FOREIGN KEY("team1_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_team2_id" FOREIGN KEY("team2_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_referee_id" FOREIGN KEY("referee_id")
REFERENCES "Referees" ("id");

ALTER TABLE "Games" ADD CONSTRAINT "fk_Games_season_id" FOREIGN KEY("season_id")
REFERENCES "Seasons" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_game_id" FOREIGN KEY("game_id")
REFERENCES "Games" ("id");

ALTER TABLE "Results" ADD CONSTRAINT "fk_Results_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

ALTER TABLE "Players" ADD CONSTRAINT "fk_Players_team_id" FOREIGN KEY("team_id")
REFERENCES "Teams" ("id");

