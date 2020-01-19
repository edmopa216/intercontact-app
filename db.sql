CREATE DATABASE IF NOT EXISTS db;

USE db;

CREATE TABLE Profile
(
    id          INT         NOT NULL AUTO_INCREMENT,
    description VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB;

CREATE TABLE Collaborator
(
    id         INT         NOT NULL AUTO_INCREMENT,
    name       VARCHAR(45) NOT NULL,
    last_name  VARCHAR(45) NOT NULL,
    dni        CHAR(8)     NOT NULL,
    user       VARCHAR(45) NOT NULL,
    password   VARCHAR(45) NOT NULL,
    profile_id INT         NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_Collaborator_Profile FOREIGN KEY (profile_id) REFERENCES Profile (id)
)
    ENGINE = InnoDB;

CREATE TABLE Service_Type
(
    id   INT         NOT NULL AUTO_INCREMENT,
    name VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB;

CREATE TABLE Client
(
    id            INT         NOT NULL AUTO_INCREMENT,
    ruc           VARCHAR(45) NOT NULL,
    business_name VARCHAR(45) NOT NULL,
    phone         INT         NOT NULL,
    PRIMARY KEY (id)
)
    ENGINE = InnoDB;

CREATE TABLE Quotation
(
    id             INT         NOT NULL AUTO_INCREMENT,
    number         VARCHAR(12) NOT NULL,
    broadcast_date DATE        NOT NULL,
    client_id      INT         NOT NULL,
    state          VARCHAR(45) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_Quotation_Client FOREIGN KEY (client_id) REFERENCES Client (id)
)
    ENGINE = InnoDB;

CREATE TABLE Quotation_Detail
(
    id              INT            NOT NULL AUTO_INCREMENT,
    quote_id        INT            NOT NULL,
    service         VARCHAR(45)    NOT NULL,
    service_type_id INT            NOT NULL,
    price           DECIMAL(18, 2) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_QuotationDetail_Quotation FOREIGN KEY (quote_id) REFERENCES Quotation (id),
    CONSTRAINT fk_QuotationDetail_ServiceType FOREIGN KEY (service_type_id) REFERENCES Service_Type (id)
)
    ENGINE = InnoDB;

CREATE TABLE Purchase_Order
(
    id               INT         NOT NULL AUTO_INCREMENT,
    quote_id         INT         NOT NULL,
    number           VARCHAR(12) NOT NULL,
    broadcast_date   DATE        NOT NULL,
    client_id        INT         NOT NULL,
    billing_type     VARCHAR(45) NOT NULL,
    billing_date     DATE        NOT NULL,
    due_payment_date DATE        NOT NULL,
    payment_date     DATE        NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_PurchaseOrder_Client FOREIGN KEY (client_id) REFERENCES Client (id),
    CONSTRAINT fk_PurchaseOrder_Quotation FOREIGN KEY (quote_id) REFERENCES Quotation (id)
)
    ENGINE = InnoDB;

CREATE TABLE Service
(
    id                  INT         NOT NULL AUTO_INCREMENT,
    purchase_order_id   INT         NOT NULL,
    service_type_id     INT         NOT NULL,
    quotation_detail_id INT         NOT NULL,
    priority            VARCHAR(45) NOT NULL,
    state               VARCHAR(45) NOT NULL,
    delivery_date       DATE        NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_Service_PurchaseOrder FOREIGN KEY (purchase_order_id) REFERENCES Purchase_Order (id),
    CONSTRAINT fk_Service_ServiceType FOREIGN KEY (service_type_id) REFERENCES Service_Type (id),
    CONSTRAINT fk_Service_QuotationDetail FOREIGN KEY (quotation_detail_id) REFERENCES Quotation_Detail (id)

)
    ENGINE = InnoDB;

CREATE TABLE Service_Assignment
(
    service_id      INT NOT NULL,
    collaborator_id INT NOT NULL,
    CONSTRAINT fk_ServiceAssignment_Service FOREIGN KEY (service_id) REFERENCES Service (id),
    CONSTRAINT fk_ServiceAssignment_Collaborator FOREIGN KEY (collaborator_id) REFERENCES Collaborator (id)

)
    ENGINE = InnoDB;


CREATE TABLE Document
(
    id              INT         NOT NULL AUTO_INCREMENT,
    description     VARCHAR(45) NOT NULL,
    client_id       INT         NOT NULL,
    service_type_id INT         NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_Document_ServiceType FOREIGN KEY (service_type_id) REFERENCES Service_Type (id),
    CONSTRAINT fk_Document_Client FOREIGN KEY (client_id) REFERENCES Client (id)
)
    ENGINE = InnoDB;

CREATE TABLE Document_Version
(
    id          INT         NOT NULL AUTO_INCREMENT,
    document_id INT         NOT NULL,
    file_name   VARCHAR(45) NOT NULL,
    upload_date DATE        NOT NULL,
    version     VARCHAR(45) NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_DocumentVersion_Document FOREIGN KEY (document_id) REFERENCES Document (id)
)
    ENGINE = InnoDB;
