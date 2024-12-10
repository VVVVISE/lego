/*
  Warnings:

  - You are about to drop the `career` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `expertise` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `personalBasics` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `projects` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `name` on table `User` required. This step will fail if there are existing NULL values in that column.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "career";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "expertise";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "personalBasics";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "projects";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "ExpertiseTag" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "expertise" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "ExpertiseList" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "individualId" INTEGER NOT NULL,
    CONSTRAINT "ExpertiseList_individualId_fkey" FOREIGN KEY ("individualId") REFERENCES "Individual" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "EducationInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "schoolName" TEXT NOT NULL,
    "undergraduate" TEXT NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME,
    "summary" TEXT,
    "careerId" INTEGER NOT NULL,
    CONSTRAINT "EducationInfo_careerId_fkey" FOREIGN KEY ("careerId") REFERENCES "Career" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ProjectInfo" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "title" TEXT NOT NULL,
    "url" TEXT,
    "position" TEXT NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME,
    "productName" TEXT,
    "summary" TEXT,
    "careerId" INTEGER NOT NULL,
    CONSTRAINT "ProjectInfo_careerId_fkey" FOREIGN KEY ("careerId") REFERENCES "Career" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Career" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "individualId" INTEGER NOT NULL,
    CONSTRAINT "Career_individualId_fkey" FOREIGN KEY ("individualId") REFERENCES "Individual" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Individual" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "Individual_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_ExpertiseTagToList" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ExpertiseTagToList_A_fkey" FOREIGN KEY ("A") REFERENCES "ExpertiseList" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ExpertiseTagToList_B_fkey" FOREIGN KEY ("B") REFERENCES "ExpertiseTag" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "profile" TEXT,
    "urls" TEXT
);
INSERT INTO "new_User" ("email", "id", "name") SELECT "email", "id", "name" FROM "User";
DROP TABLE "User";
ALTER TABLE "new_User" RENAME TO "User";
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "ExpertiseList_individualId_key" ON "ExpertiseList"("individualId");

-- CreateIndex
CREATE UNIQUE INDEX "Career_individualId_key" ON "Career"("individualId");

-- CreateIndex
CREATE UNIQUE INDEX "Individual_userId_key" ON "Individual"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "_ExpertiseTagToList_AB_unique" ON "_ExpertiseTagToList"("A", "B");

-- CreateIndex
CREATE INDEX "_ExpertiseTagToList_B_index" ON "_ExpertiseTagToList"("B");
