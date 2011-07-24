CREATE TABLE "contacts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "location_city" varchar(255), "number" varchar(255), "person_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "districts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "person_id" integer, "zipcode_id" integer, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "people" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "first_name" varchar(255), "last_name" varchar(255), "position" varchar(255), "created_at" datetime, "updated_at" datetime, "image_link" varchar(255));
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "zipcodes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "number" integer, "created_at" datetime, "updated_at" datetime);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('20110723180503');

INSERT INTO schema_migrations (version) VALUES ('20110723180950');

INSERT INTO schema_migrations (version) VALUES ('20110723181147');

INSERT INTO schema_migrations (version) VALUES ('20110723181404');

INSERT INTO schema_migrations (version) VALUES ('20110724182926');