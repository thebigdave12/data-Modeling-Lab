CREATE TABLE "public.User" (
	"user_id" serial NOT NULL,
	"username" varchar NOT NULL UNIQUE,
	"password" varchar NOT NULL,
	"email" varchar NOT NULL UNIQUE,
	CONSTRAINT "User_pk" PRIMARY KEY ("user_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Recipe" (
	"recipe_id" serial NOT NULL,
	"ingredients_id" integer NOT NULL,
	"instructions" TEXT NOT NULL,
	"isPrivate" BOOLEAN NOT NULL,
	"user_id" integer,
	CONSTRAINT "Recipe_pk" PRIMARY KEY ("recipe_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Ingredients" (
	"ingredients_id" serial NOT NULL,
	"ingredient_name" TEXT NOT NULL,
	CONSTRAINT "Ingredients_pk" PRIMARY KEY ("ingredients_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Occasions" (
	"occasion_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"recipe_id" integer NOT NULL,
	CONSTRAINT "Occasions_pk" PRIMARY KEY ("occasion_id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.Grocery" (
	"groceryList_id" serial NOT NULL,
	"user_id" integer NOT NULL,
	"ingredients_id" integer NOT NULL,
	CONSTRAINT "Grocery_pk" PRIMARY KEY ("groceryList_id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk0" FOREIGN KEY ("ingredients_id") REFERENCES "Ingredients"("ingredients_id");
ALTER TABLE "Recipe" ADD CONSTRAINT "Recipe_fk1" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");


ALTER TABLE "Occasions" ADD CONSTRAINT "Occasions_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");
ALTER TABLE "Occasions" ADD CONSTRAINT "Occasions_fk1" FOREIGN KEY ("recipe_id") REFERENCES "Recipe"("recipe_id");

ALTER TABLE "Grocery" ADD CONSTRAINT "Grocery_fk0" FOREIGN KEY ("user_id") REFERENCES "User"("user_id");
ALTER TABLE "Grocery" ADD CONSTRAINT "Grocery_fk1" FOREIGN KEY ("ingredients_id") REFERENCES "Ingredients"("ingredients_id");






