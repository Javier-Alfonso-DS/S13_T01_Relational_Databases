CREATE TABLE `ShoppingTable`(
    `id` INT UNSIGNED NOT NULL,
    `ProviderId` INT UNSIGNED NOT NULL,
    `ProductId` INT UNSIGNED NOT NULL,
    `EstablishmentId` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `ShoppingTable` ADD PRIMARY KEY `shoppingtable_id_primary`(`id`);
ALTER TABLE
    `ShoppingTable` ADD INDEX `shoppingtable_providerid_index`(`ProviderId`);
ALTER TABLE
    `ShoppingTable` ADD INDEX `shoppingtable_productid_index`(`ProductId`);
ALTER TABLE
    `ShoppingTable` ADD INDEX `shoppingtable_establishmentid_index`(`EstablishmentId`);
CREATE TABLE `ProviderTable`(
    `id` INT UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `Address` TEXT NOT NULL
);
ALTER TABLE
    `ProviderTable` ADD PRIMARY KEY `providertable_id_primary`(`id`);
CREATE TABLE `ProductsTable`(
    `id` INT UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `TypeOfProductId` INT UNSIGNED NOT NULL,
    `ProviderId` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `ProductsTable` ADD PRIMARY KEY `productstable_id_primary`(`id`);
ALTER TABLE
    `ProductsTable` ADD INDEX `productstable_typeofproductid_index`(`TypeOfProductId`);
ALTER TABLE
    `ProductsTable` ADD INDEX `productstable_providerid_index`(`ProviderId`);
CREATE TABLE `TypeOfProducts`(
    `id` INT UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `Description` TEXT NOT NULL
);
ALTER TABLE
    `TypeOfProducts` ADD PRIMARY KEY `typeofproducts_id_primary`(`id`);
CREATE TABLE `EstablismentTable`(
    `id` INT UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `Location` TEXT NOT NULL,
    `Area` TEXT NOT NULL,
    `EmployeesId` INT UNSIGNED NOT NULL,
    `CostumersId` INT UNSIGNED NOT NULL
);
ALTER TABLE
    `EstablismentTable` ADD PRIMARY KEY `establismenttable_id_primary`(`id`);
ALTER TABLE
    `EstablismentTable` ADD INDEX `establismenttable_employeesid_index`(`EmployeesId`);
ALTER TABLE
    `EstablismentTable` ADD INDEX `establismenttable_costumersid_index`(`CostumersId`);
CREATE TABLE `EmployeesTable`(
    `id` INT UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `Surnames` TEXT NOT NULL,
    `StartDate` DATETIME NOT NULL,
    `EstablismentId` INT NOT NULL,
    `Address` TEXT NOT NULL,
    `PhoneNumber` INT NOT NULL,
    `DNI` INT NOT NULL,
    `DNI_letter` TEXT NOT NULL,
    `DateOfBirth` DATE NOT NULL
);
ALTER TABLE
    `EmployeesTable` ADD PRIMARY KEY `employeestable_id_primary`(`id`);
ALTER TABLE
    `EmployeesTable` ADD INDEX `employeestable_establismentid_index`(`EstablismentId`);
CREATE TABLE `CustomersTable`(
    `id` INT UNSIGNED NOT NULL,
    `Name` TEXT NOT NULL,
    `Surnames` TEXT NOT NULL,
    `NIF` TEXT NOT NULL,
    `Address` TEXT NOT NULL
);
ALTER TABLE
    `CustomersTable` ADD PRIMARY KEY `customerstable_id_primary`(`id`);
ALTER TABLE
    `ShoppingTable` ADD CONSTRAINT `shoppingtable_productid_foreign` FOREIGN KEY(`ProductId`) REFERENCES `ProductsTable`(`id`);
ALTER TABLE
    `ProductsTable` ADD CONSTRAINT `productstable_typeofproductid_foreign` FOREIGN KEY(`TypeOfProductId`) REFERENCES `TypeOfProducts`(`id`);
ALTER TABLE
    `ProductsTable` ADD CONSTRAINT `productstable_providerid_foreign` FOREIGN KEY(`ProviderId`) REFERENCES `ProviderTable`(`id`);
ALTER TABLE
    `ShoppingTable` ADD CONSTRAINT `shoppingtable_providerid_foreign` FOREIGN KEY(`ProviderId`) REFERENCES `ProviderTable`(`id`);
ALTER TABLE
    `ShoppingTable` ADD CONSTRAINT `shoppingtable_establishmentid_foreign` FOREIGN KEY(`EstablishmentId`) REFERENCES `EstablismentTable`(`id`);
ALTER TABLE
    `EstablismentTable` ADD CONSTRAINT `establismenttable_employeesid_foreign` FOREIGN KEY(`EmployeesId`) REFERENCES `EmployeesTable`(`id`);
ALTER TABLE
    `EstablismentTable` ADD CONSTRAINT `establismenttable_costumersid_foreign` FOREIGN KEY(`CostumersId`) REFERENCES `CustomersTable`(`id`);