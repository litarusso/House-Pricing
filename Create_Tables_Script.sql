CREATE TABLE "MSZoning" (
  "id" varchar(10) PRIMARY KEY,
  "zone_desc" varchar(100)
);

CREATE TABLE "LotShape" (
  "id" varchar(10) PRIMARY KEY,
  "lotshape_desc" varchar(100)
);

CREATE TABLE "Utilities" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "Neighborhood" (
  "id" varchar(10) PRIMARY KEY,
  "neighborhood_name" varchar(100)
);

CREATE TABLE "BldgType" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "Conditions" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "Heating" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "Electrical" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "Fence" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "RoofMatl" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "Miscfeature" (
  "id" varchar(10) PRIMARY KEY,
  "desc" varchar(100)
);

CREATE TABLE "HouseSaleHistory" (
  "id" int PRIMARY KEY,
  "mszoning_id" varchar(10),
  "lotarea" numeric,
  "street" varchar(50),
  "lotshape_id" varchar(10),
  "utility_id" varchar(10),
  "neighborhood_id" varchar(10),
  "building_type_id" varchar(10),
  "yearbuilt" datetime,
  "yearrenoadd" datetime,
  "roof_material_id" varchar(10),
  "exterior_condition" varchar(10),
  "basement_condition" varchar(10),
  "total_basement_sqft" numeric,
  "heating_id" varchar(10),
  "heating_condition" varchar(10),
  "electrical_id" varchar(10),
  "1st_floor_sqft" numeric,
  "2nd_floor_sqft" numeric,
  "ground_level_sqft" numeric,
  "fullbath" int,
  "halfbath" int,
  "bedroom" int,
  "fireplace" int,
  "fireplace_cond_id" varchar(10),
  "garage_type" varchar(100),
  "garage_cars" int,
  "paved_drive" int,
  "wood_deck_sqft" numeric,
  "pool_sqft" numeric,
  "fence_id" varchar(10),
  "miscfeature" varchar(10),
  "misc_feature_value" numeric,
  "sold_date" datetime,
  "sale_price" numeric
);

CREATE TABLE "HouseSalePricePrediction" (
  "id" int PRIMARY KEY,
  "mszoning_id" varchar(10),
  "lotarea" numeric,
  "street" varchar(50),
  "lotshape_id" varchar(10),
  "utility_id" varchar(10),
  "neighborhood_id" varchar(10),
  "building_type_id" varchar(10),
  "yearbuilt" datetime,
  "yearrenoadd" datetime,
  "roof_material_id" varchar(10),
  "exterior_condition" varchar(10),
  "basement_condition" varchar(10),
  "total_basement_sqft" numeric,
  "heating_id" varchar(10),
  "heating_condition" varchar(10),
  "electrical_id" varchar(10),
  "1st_floor_sqft" numeric,
  "2nd_floor_sqft" numeric,
  "ground_level_sqft" numeric,
  "fullbath" int,
  "halfbath" int,
  "bedroom" int,
  "fireplace" int,
  "fireplace_cond_id" varchar(10),
  "garage_type" varchar(100),
  "garage_cars" int,
  "paved_drive" int,
  "wood_deck_sqft" numeric,
  "pool_sqft" numeric,
  "fence_id" varchar(10),
  "miscfeature" varchar(10),
  "misc_feature_value" numeric,
  "prediction_date" datetime,
  "predict_sell_price" numeric
);

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("mszoning_id") REFERENCES "MSZoning" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("lotshape_id") REFERENCES "LotShape" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("utility_id") REFERENCES "Utilities" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("neighborhood_id") REFERENCES "Neighborhood" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("building_type_id") REFERENCES "BldgType" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("roof_material_id") REFERENCES "RoofMatl" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("exterior_condition") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("basement_condition") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("heating_id") REFERENCES "Heating" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("heating_condition") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("electrical_id") REFERENCES "Electrical" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("fireplace_cond_id") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("fence_id") REFERENCES "Fence" ("id");

ALTER TABLE "HouseSaleHistory" ADD FOREIGN KEY ("miscfeature") REFERENCES "Miscfeature" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("mszoning_id") REFERENCES "MSZoning" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("lotshape_id") REFERENCES "LotShape" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("utility_id") REFERENCES "Utilities" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("neighborhood_id") REFERENCES "Neighborhood" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("building_type_id") REFERENCES "BldgType" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("roof_material_id") REFERENCES "RoofMatl" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("exterior_condition") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("basement_condition") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("heating_id") REFERENCES "Heating" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("heating_condition") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("electrical_id") REFERENCES "Electrical" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("fireplace_cond_id") REFERENCES "Conditions" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("fence_id") REFERENCES "Fence" ("id");

ALTER TABLE "HouseSalePricePrediction" ADD FOREIGN KEY ("miscfeature") REFERENCES "Miscfeature" ("id");
