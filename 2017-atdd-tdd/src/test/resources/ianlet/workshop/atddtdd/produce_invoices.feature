# Ce fichier est la propriete d'Elapse Technologies et ne peut etre partage ou reutilise
# seulement sur autorisation explicite de leur part.
# ----
# This file courtesy of Elapse Technologies should be not shared nor used without their consent

@Invoice @pers:CorporateCustomer @pers:ServiceCustomer @pers:BillingDept @theme:invoice @sys:billing @bc:billing
Feature: Produce an invoice for a customer

  In order to receive only one bill for all my stuff or to use a receivable account
  As the corporate or special customer
  I want to be able to receive an invoice

  // Business Rules

  - R1: All items are on the invoice with their unit price
  - R2: If an item is billed more than once, it is listed only once with a quantity
  - R3: A subtotal is on the invoice (sum of all items)
  - R4: A total is ont the invoice (see limit L3)

  // Limits

  - L1: The invoice is not linked to the online shopping cart and is not linked directly to products in the inventory
  - L2: For now, we don't deal with shipping fees
  - L3: The formula for the total depends on other Features (see features with @Invoice-Total)

  // Examples

  @Invoice-Total @Invoice-Content
  Scenario: PI1- The one where the invoice has some items [R1, R3, R4]
    When the invoice is produced with these items:
      | itemName | itemUnitPrice |
      | Milk     | 3.99          |
      | Pen      | 5.25          |
    Then the invoice contains those items:
      | itemDescription | unitPrice | quantity |
      | Milk            | 3.99      | 1        |
      | Pen             | 5.25      | 1        |
    And the invoice subtotal is 9.24$
    And a total is present on the invoice

  @Invoice-Content
  Scenario: PI2- The one where an item is bought multiple times [R2]
    When the invoice is produced with these items:
      | itemName | itemUnitPrice |
      | Milk     | 3.99          |
      | Milk     | 3.99          |
    Then the invoice contains those items:
      | itemDescription | unitPrice | quantity |
      | Milk            | 3.99      | 2        |
    And the invoice subtotal is 7.98$

  @Invoice-Content
  Scenario: PI3- The one where an item is bought multiple times but at different prices [R2]
    When the invoice is produced with these items:
      | itemName   | itemUnitPrice |
      | Consulting | 4,000.25      |
      | Consulting | 2,000.55      |
    Then the invoice contains those items:
      | itemDescription | unitPrice | quantity |
      | Consulting      | 4,000.25  | 1        |
      | Consulting      | 2,000.55  | 1        |
