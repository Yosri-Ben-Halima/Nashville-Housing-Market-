-- Select the database
USE `mysql project`;

-- Create Property table
CREATE TABLE `Property` (
    `PropertyID` INT AUTO_INCREMENT NOT NULL ,
    `ParcelID` VARCHAR(255)  NOT NULL ,
    `LandUse` VARCHAR(255)  NOT NULL ,
    `PropertyAddress` VARCHAR(255)  NOT NULL ,
    `PropertyCity` VARCHAR(255)  NOT NULL ,
    `Acreage` DECIMAL(10)  NOT NULL ,
    `TaxDistrict` VARCHAR(255)  NOT NULL ,
    `LandValue` DECIMAL(15)  NOT NULL ,
    `BuildingValue` DECIMAL(15)  NOT NULL ,
    `TotalValue` DECIMAL(15)  NOT NULL ,
    `YearBuilt` YEAR  NOT NULL ,
    `Bedrooms` INT  NOT NULL ,
    `FullBath` INT  NOT NULL ,
    `HalfBath` INT  NOT NULL ,
    `OwnerID` INT  NOT NULL ,
    PRIMARY KEY (
        `PropertyID`
    )
);

-- Create Sale table
CREATE TABLE `Sale` (
    `SaleID` INT AUTO_INCREMENT NOT NULL ,
    `PropertyID` INT  NOT NULL ,
    `SaleDate` DATE  NOT NULL ,
    `SalePrice` DECIMAL(15)  NOT NULL ,
    `LegalReference` VARCHAR(255)  NOT NULL ,
    `SoldAsVacant` BOOLEAN  NOT NULL ,
    PRIMARY KEY (
        `SaleID`
    )
);

-- Create Owner table
CREATE TABLE `Owner` (
    `OwnerID` INT AUTO_INCREMENT NOT NULL ,
    `OwnerName` VARCHAR(255)  NOT NULL ,
    `OwnerAddress` VARCHAR(255)  NOT NULL ,
    `OwnerCity` VARCHAR(255)  NOT NULL ,
    `OwnerState` VARCHAR(255)  NOT NULL ,
    PRIMARY KEY (
        `OwnerID`
    )
);

-- Add foreign keys
ALTER TABLE `Property` ADD CONSTRAINT `fk_Property_OwnerID` FOREIGN KEY(`OwnerID`)
REFERENCES `Owner` (`OwnerID`);

ALTER TABLE `Sale` ADD CONSTRAINT `fk_Sale_PropertyID` FOREIGN KEY(`PropertyID`)
REFERENCES `Property` (`PropertyID`);