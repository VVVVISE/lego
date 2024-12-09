-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "name" TEXT
);

-- CreateTable
CREATE TABLE "personalBasics" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "profile" TEXT NOT NULL,
    "urls" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "expertise" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "coreExpertise" TEXT NOT NULL,
    "otherExpertise" TEXT NOT NULL,
    "attributes" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "career" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "education" TEXT NOT NULL,
    "works" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "projects" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "URL" TEXT,
    "position" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "productName" TEXT,
    "summary" TEXT
);

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
