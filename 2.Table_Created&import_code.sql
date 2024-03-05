-- Create table for import data 

CREATE TABLE IF NOT EXISTS public.users(
    user_id varchar(50) NOT NULL PRIMARY KEY,
    active boolean,
    createddate date,
    lastlogin date,
    role varchar(50),
    signupsource varchar(50),
    state varchar(50)
);

CREATE TABLE IF NOT EXISTS public.products (
    brand_id VARCHAR(255),
	barcode VARCHAR(255),
    category VARCHAR(255),
    categoryCode VARCHAR(255),
    cpg VARCHAR(255),
    name VARCHAR(255),
    topBrand float,
    brandCode VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS public.receipts (
    receipt_id VARCHAR(255) PRIMARY KEY,
    bonusPointsEarned float,
    bonusPointsEarnedReason VARCHAR(255),
    createDate DATE,
    dateScanned DATE,
    finishedDate DATE,
    modifyDate DATE,
    pointsAwardedDate DATE,
    pointsEarned float,
    purchaseDate DATE,
    purchasedItemCount float,
    rewardsReceiptStatus VARCHAR(50),
    totalSpent float,
	user_id VARCHAR(255)
	
);



CREATE TABLE IF NOT EXISTS public.receipt_items (
	receipt_id VARCHAR(255),
    item_id VARCHAR(255),
    barcode VARCHAR(50),
    userFlaggedBarcode VARCHAR(50),
    finalPrice float,
    itemPrice float,
    quantityPurchased float
);






