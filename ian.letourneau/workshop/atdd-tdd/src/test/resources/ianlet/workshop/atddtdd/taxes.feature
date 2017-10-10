# Ce fichier est la propriete d'Elapse Technologies et ne peut etre partage ou reutilise
# seulement sur autorisation explicite de leur part.
# ----
# This file courtesy of Elapse Technologies should be not shared nor used without their consent

@Invoice @Tax @pers:BillingDept @theme:invoice @sys:billing @bc:billing
Feature: Calculate taxes on applicable items

  In order to comply with local laws
  As the billing department
  I want to charge taxes on taxable items

  // Business rules

  - R0: Taxes are sumed up in the total of the invoice
  - R1: Taxes are only applied on taxable items
  - R2: The tax rate depend on the customer's geographical area
  - R3: (for now) If the cutomer's area tax rate is unknown -> don't charge taxes

  // Limits
  - L1: (for now) We only support flat unique tax rate (not an algo to apply 1-TPS -> 2-TVQ on TPS)

  // Examples

  @Invoice-Total @Fees
  Scenario: TX1- The one where the total is sumed up
    Given the tax rate is 10%
    And no other fees should be charged
    When the invoice is produced with these items:
      | itemName | itemUnitPrice | taxable |
      | Milk     | 3.00          | Yes     |
      | BBQ      | 700.00        | Yes     |
    Then invoice total is 773.30$

  @Tax-Calculation
  Scenario Outline: TX2- The one where we apply taxes only on taxable items [R1]
    Given the item '<itemName>' at <price> and is taxable '<taxable!>'
    And the tax rate is 10%
    When we apply taxes on '<itemName>'
     #Then the total price is <total?>					? Pourquoi pas ?
    Then the price for this item with taxes is <total?>

    Examples:
      | itemName | price | taxable! | total? |
      | Milk     | 3.00  | No       | 3.00   |
      | Pen      | 4.00  | Yes      | 4.40   |

  @Tax-Calculation
  Scenario Outline: TX3- The one where tax rates depend on the customer's area [R2, R3]
     # R3 pourrait(devrait?) etre dans son propre scenario ??
    Given known tax rates for those areas
      | area | taxRate |
      | QC   | 14.975  |
      | PEI  | 15      |
    And a customer located at <customerArea>
    When we apply taxes on a taxable item listed at 100.00$ for that customer
    Then the price for this item with taxes is <total?>

    Examples:
      | customerArea | total?  |
      | QC           | 114.975 |
      | PEI          | 115     |
      | UNKNOWN      | 100     |
