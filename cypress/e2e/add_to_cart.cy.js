
describe("cart", () => {
  
  
  it("start on home page and navigate to product details page", () => {
    cy.visit("http://localhost:3000/");
    cy.get(".products article").should("be.visible");
    cy.contains("My Cart (0)");
    
    cy.get('article').first;
    cy.contains("Add").click();

    cy.contains("My Cart (1)");


    
  });

});