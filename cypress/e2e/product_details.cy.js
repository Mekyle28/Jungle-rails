
describe("product_details", () => {
  
  
  it("start on home page and navigate to product details page", () => {
    cy.visit("/");
    cy.get(".products article").should("be.visible");
    // cy.get("[alt='Giant Tea]").click();
    cy.get('article').contains("Giant Tea").click();

    cy.url().should("include", "/products/1");
  });

});